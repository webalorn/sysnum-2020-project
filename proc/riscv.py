import hdl
from hdl import reg, Bit, mux, concat, bit, RamOp, Register
from hdl.blocks import MultiSourceReg, virtual, MultiControl

from memory import RamController, RomController, MemoryController, RegisterController
from decoder import RiscDecoder
import operations as opctrl


class Proc:
    INPUTS = [
        ("tic", 1),
        ("hdd", 32),
        ("keyboard", 32),
        ("init_time", 32),
    ]
    OUTPUTS = [  # Size must be at most 32
        ("input_signal", 7),  # Can't be written on
        ("poweroff", 1),  # Index 0
        ("console", 32),
        ("hdd_read_at", 32),
        ("screen", 32),
    ]
    WORD = 32
    RAM_ADDR_SIZE = 26  # The last 16 bits of a word will be used
    ROM_ADDR_SIZE = 26  # The last 16 bits of a word will be used
    NB_REGISTERS = 32

    MUL_ENABLED = False
    DIV_ENABLED = False

    # ========== Build ==========

    def __init__(self):
        self.M_EXT_ENABLED = self.MUL_ENABLED or self.DIV_ENABLED
        self.zero_var = hdl.Assign(0, name='zero')
        self.one_var = hdl.Assign(1, name='one')

        # State registers
        self.has_booted = Register(self.one_var, name='hasbooted')
        self.reg_hold_intruction = Register(size=32, name='hold_instruction')
        self.reg_has_hold = Register(name='has_hold')

        # Registers
        self.reg_pc = MultiSourceReg(32, name='reg_pc')
        self.registers = RegisterController(self.NB_REGISTERS, self.WORD)

        # Memory management
        self.ram = RamController(self.RAM_ADDR_SIZE, self.WORD)
        self.rom = RomController(self.ROM_ADDR_SIZE, self.WORD)
        self.memory = MemoryController(self.rom, self.ram, self.OUTPUTS)

        # Processor architecture
        self.op_controller = opctrl.OperationController(self)

    def generate(self, *input_args):
        self.in_vars = {
            desc[0]: val
            for desc, val in zip(self.INPUTS, input_args)
        }
        self.memory.input_from(input_args)

        # Move instruction pointer and fetch instruction
        cur_addr = mux(self.has_booted, '001' + '0' * 29, self.reg_pc)

        self.next_intruction_addr = self.adder(
            self.reg_pc, bit(self.WORD // 8, size=self.WORD))[0]
        # If an instruction has been executed, advance pointer
        self.reg_pc.add(self.reg_has_hold, self.next_intruction_addr)
        # If no instruction has been executed, do NOT move pointer
        self.reg_pc.add(~self.reg_has_hold, cur_addr)

        # Execute instruction
        self.op_controller.decode_instruction(self.reg_has_hold,
                                              self.reg_hold_intruction)

        # Fetch instruction for next cycle from RAM / ROM / Registers
        self.reg_has_hold.source(~self.memory.used)
        mem_out = self.memory.read_at(~self.memory.used, self.reg_pc.reg_input,
                                      True)
        self.reg_hold_intruction.source(mem_out)

        # Read outputs
        return self.memory.fetch_output()

    def build(self):
        chip = hdl.Chip(self.generate,
                        inputs=[p[1] for p in self.INPUTS],
                        outputs=[p[1] for p in self.OUTPUTS],
                        input_names=[p[0] for p in self.INPUTS],
                        output_names=[p[0] for p in self.OUTPUTS])
        print("Used", len(chip.varname_to_bits), "variables")
        print("Total size of",
              sum(len(x) for x in chip.varname_to_bits.values()))
        return chip

    # ========== Computing functions ==========

    def adder(self, a, b, r='0'):
        return hdl.simple_adder(a, b, r)


if __name__ == "__main__":
    processor = Proc()
    chip = processor.build()
    chip.compile_netlist('__build__/riscv.net')
