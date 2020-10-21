import math

import hdl
from hdl import reg, Bit, BitRegister, mux, concat, bit, RamOp, RomOp, Register
from hdl.blocks import MultiSourceReg, virtual, MultiControl, Multiplexer

from decoder import SimpleDecoder


def get_byte_addr(addr):
    addr = bit(addr)
    """ Because the RAM and ROM are byte-aligned """
    return concat(addr[3:] + list('000'))


class RomController:
    def __init__(self, rom_size, word_size):
        self.rom_size = rom_size  # Size of the address
        self.word_size = word_size

        self.inputs = MultiControl()
        self.output = RomOp(rom_size, word_size,
                            virtual(rom_size, self.inputs))

    def read_at(self, control, addr):
        addr = get_byte_addr(addr)
        self.inputs.add(control, addr[-self.rom_size:])


class RamController:
    def __init__(self, ram_size, word_size):
        self.ram_size = ram_size  # Size of the address
        self.word_size = word_size

        self.inputs = MultiControl()
        self.write_addrs = MultiControl()
        self.write_data = MultiControl()
        self.write_enabled = virtual(1, bit('0'))

        self.output = RamOp(ram_size, word_size, virtual(ram_size, self.inputs),
                            self.write_enabled, virtual(
                                ram_size, self.write_addrs),
                            virtual(word_size, self.write_data))

    def read_at(self, control, addr):
        addr = get_byte_addr(addr)
        self.inputs.add(control, addr[-self.ram_size:])

    def write_at(self, control, addr, value):
        addr = get_byte_addr(addr)
        self.write_enabled.set(self.write_enabled.get() | control)
        self.write_addrs.add(control, addr[-self.ram_size:])
        self.write_data.add(control, value)


class MemoryController:
    def __init__(self, ram_is_source, rom, ram):
        self.ram_is_source = ram_is_source
        self.rom = rom
        self.ram = ram

        # Set default actions
        self.rom.read_at('0', '0' * self.rom.rom_size)
        self.ram.read_at('1', '0' * self.ram.ram_size)
        self.ram.write_at('0', '0' * self.ram.ram_size,
                          '0' * self.ram.word_size)

    def get(self):
        """ Return the current memory source """
        return mux(self.ram_is_source, self.rom.output, self.ram.output)

    def read_at(self, control, addr):
        self.rom.read_at(control & (~self.ram_is_source), addr)
        self.ram.read_at(control & (self.ram_is_source), addr)

    def write_at(self, control, addr, value):
        """ Always writes in RAM """
        self.ram.write_at(control, addr, value)

# ========== Register control ==========


class RegisterController:
    """
        Used to control registers. You can use each writer and reader at most ONE time per cycle.
        Register 0 is always 0
    """

    def __init__(self, nb_registers, word_size, nb_readers=0, nb_writers=0):
        self.nb_registers = nb_registers
        self.reg_addr_size = math.ceil(math.log2(nb_registers))
        self.word_size = word_size

        self.registers = [Register(size=word_size)
                          for _ in range(nb_registers)]
        self.reg_inputs = [MultiControl(('1', register))
                           for register in self.registers]

        self.registers[0] = bit(0, size=word_size)
        self.reg_inputs[0] = None

        for i_reg in range(1, nb_registers):
            self.registers[i_reg].source(
                virtual(word_size, self.reg_inputs[i_reg]))

        self.readers = [self.build_reader() for _ in range(nb_readers)]
        self.writers = [self.build_writer() for _ in range(nb_readers)]

    def build_reader(self):
        controller = MultiControl()  # add (control, addr)
        plex = Multiplexer(virtual(self.reg_addr_size, controller))
        plex.add(*self.registers)

        return (controller, virtual(self.word_size, plex))

    def build_writer(self):
        controller = MultiControl()  # add (control, addr)
        reg_controls = SimpleDecoder(virtual(self.reg_addr_size, controller))

        return (controller, reg_controls)

    # Access to read / write

    @hdl.f
    def read_reg(self, ireader: int, control: 'bit', addr: 'bus'):
        while ireader >= len(self.readers):
            self.readers.append(self.build_reader())

        if len(addr) != self.reg_addr_size:
            raise hdl.BuildError(
                f"The size of the register address must be {self.reg_addr_size}, not {len(addr)}")
        controller, plex = self.readers[ireader]
        controller.add(control, addr)

        return plex

    @hdl.f
    def write_reg(self, iwriter: int, control: 'bit', addr: 'bus', val: 'bus'):
        while iwriter >= len(self.writers):
            self.writers.append(self.build_writer())

        if len(addr) != self.reg_addr_size:
            raise hdl.BuildError(
                f"The size of the register address must be {self.reg_addr_size}, not {len(addr)}")
        if len(val) != self.word_size:
            raise hdl.BuildError(
                f"The size of the register value must be {self.word_size}, not {len(val)}")

        controller, reg_controls = self.writers[iwriter]

        controller.add(control, addr)
        for ireg, reg_in in enumerate(self.reg_inputs):
            if reg_in is not None:
                reg_in.add(control & reg_controls.get_control(ireg), val)
