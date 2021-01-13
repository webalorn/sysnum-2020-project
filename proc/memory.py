import math

import hdl
from hdl import reg, Bit, mux, concat, bit, RamOp, RomOp, Register
from hdl.blocks import MultiSourceReg, virtual, MultiControl, Multiplexer

from decoder import SimpleDecoder, RiscDecoder
import arith

IO_SIGNIFICANT_BITS = 7


class RomController:
    def __init__(self, rom_size, word_size):
        self.rom_size = rom_size  # Size of the address
        self.word_size = word_size

        self.inputs = MultiControl()
        self.output = RomOp(rom_size, word_size,
                            virtual(rom_size, self.inputs))

    def read_at(self, control, addr):
        # addr = get_byte_addr(addr)
        self.inputs.add(control, addr[-self.rom_size:])
        return self.output

    def write_at(self, control, addr, value):
        pass


class RamController:
    def __init__(self, ram_size, word_size):
        self.ram_size = ram_size  # Size of the address
        self.word_size = word_size

        self.inputs = MultiControl()
        self.write_addrs = hdl.VirtualBit(ram_size)
        self.write_data = hdl.VirtualBit(word_size)
        self.write_enabled = virtual(1, bit('0'))

        self.output = RamOp(ram_size, word_size,
                            virtual(ram_size, self.inputs), self.write_enabled,
                            self.write_addrs, self.write_data)

    def read_at(self, control, addr):
        self.inputs.add(control, addr[-self.ram_size:])
        return self.output

    def write_at(self, control, addr, value):
        self.write_enabled.set(control)
        self.write_addrs.set(addr[-self.ram_size:])
        self.write_data.set(value)


class InputController:
    def __init__(self, inputs):
        self.input_control = MultiControl()
        self.input_addr = virtual(IO_SIGNIFICANT_BITS, self.input_control)

        self.plexer = Multiplexer(control=self.input_addr)
        self.plexer_out = virtual(32, self.plexer)

        self.plexer.plzshutup = True
        self.plexer.add(*inputs)
        # Read at -1 if no address
        self.read_at(1, bit(-1, size=32))

    def read_at(self, control, addr):
        # Because it is 32bits-addressed
        self.input_control.add(control, addr[:-5][-IO_SIGNIFICANT_BITS:])
        return arith.left_shift(self.plexer_out, addr[-5:])

    def write_at(self, control, addr, value):
        pass


class OutputController:
    def __init__(self, out_sizes):
        self.outputs = [bit(0, size=s) for s in out_sizes]
        self.out_addresses = [
            bit(k, size=IO_SIGNIFICANT_BITS) for k in range(len(out_sizes))
        ]

    def fetch(self):
        return self.outputs

    def write_at(self, control, addr, value):
        # Because it is 32bit-addressed
        value = arith.right_shift(value, addr[-5:])
        addr = addr[:-5][-IO_SIGNIFICANT_BITS:]

        for i_out in range(len(self.outputs)):
            bit_eq = ~(addr ^ self.out_addresses[i_out])
            is_eq = hdl.merge_with_op(hdl.AndOp, bit_eq)
            length = len(self.outputs[i_out])

            self.outputs[i_out] = mux(is_eq & control, self.outputs[i_out],
                                      value[-length:])

    def read_at(self, control, addr):
        return None


class MemoryController:
    def __init__(self, rom, ram, out_format):
        self.input_signal = bit(-1, size=out_format[0][1])
        # We don't add the first output to the controller because it is reserved
        self.output = OutputController([size for _, size in out_format[1:]])
        self.sources = [
            ('000', ram, True),
            ('001', rom, True),
            ('101', self.output, False),
        ]
        self.used = bit(0)  # If the ROM or RAM has already been used

        # Set default actions
        rom.read_at('0', '0' * rom.rom_size)
        ram.read_at('1', '0' * ram.ram_size)
        # ram.write_at('0', '0' * ram.ram_size, '0' * ram.word_size)

    @hdl.f
    def read_at(self, control: 'bit', addr: 32, memory_only=False):
        dest, addr = addr[:3], addr[3:][:-2] + bit('00000')
        self.used = self.used | (control &
                                 (~(dest[0] | dest[1])))  # RAM and ROM -> 00x
        output = bit(0, size=32)

        for dest_id, dest_obj, is_memory in self.sources:
            if not memory_only or is_memory:
                isdest = ~(bit(dest) ^ dest_id)
                isdest = isdest[0] & isdest[1] & isdest[2]
                dest_out = dest_obj.read_at(control & isdest, addr)
                if dest_out is not None:
                    output = mux(isdest, output, dest_out)
        return output

    @hdl.f
    def write_at(self, control: 'bit', addr: 32, value: 32):
        dest, addr = addr[:3], addr[3:-2] + bit('00000')
        for dest_id, dest_obj, is_memory in self.sources:
            isdest = bit(True)
            for a, b in zip(dest_id, dest):
                isdest = isdest & (b if a == '1' else ~b)
            dest_obj.write_at(control & isdest, addr, value)

    def input_from(self, inputs):
        inputs = [hdl.extend(32, var) for var in inputs]
        mem = InputController(inputs)
        self.input_signal = mem.input_addr
        self.sources.append(('100', mem, True))

    def fetch_output(self):
        in_sig_size = len(self.input_signal)
        return [self.input_signal[-in_sig_size:]] + self.output.fetch()


# ========== Register control ==========


class RegisterController:
    """
        Used to control registers. You can use each writer and reader at most ONE time per cycle.
        Register 0 is always 0
    """
    def __init__(self, nb_registers, word_size):
        self.nb_registers = nb_registers
        self.reg_addr_size = math.ceil(math.log2(nb_registers))
        self.word_size = word_size

        self.registers = [
            Register(size=word_size, name=f'register_{i}')
            for i in range(nb_registers)
        ]
        self.registers[0] = bit(0, size=word_size)

    # Access to read / write

    @hdl.f
    def read_reg(self, addr: 'bus'):
        plex = Multiplexer(addr)
        plex.add(*self.registers)

        return plex.build()

    @hdl.f
    def write_reg(self, control: 'bit', addr: 'bus', val: 'bus'):
        if len(addr) != self.reg_addr_size:
            raise hdl.BuildError(
                f"The size of the register address must be {self.reg_addr_size}, not {len(addr)}"
            )
        if len(val) != self.word_size:
            raise hdl.BuildError(
                f"The size of the register value must be {self.word_size}, not {len(val)}"
            )

        reg_controls = SimpleDecoder(addr)

        for i_reg, register in enumerate(self.registers):
            if i_reg:
                register.source(
                    mux(control & reg_controls.get_control(i_reg), register,
                        val))
