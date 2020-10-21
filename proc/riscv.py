import hdl
from hdl import reg, Bit, BitRegister, mux, concat, bit, RamOp
from hdl.blocks import MultiSourceReg, virtual, MultiControl

from memory import RamController, RomController, MemoryController, RegisterController
from decoder import RiscDecoder
import operations as opctrl


class Proc:
    INPUTS = [
        ("tic", 1),
    ]
    OUTPUTS = [
        ("answer", 1),
    ]
    WORD = 32
    RAM_ADDR_SIZE = 16  # The last 16 bits of a word will be used
    ROM_ADDR_SIZE = 16  # The last 16 bits of a word will be used
    NB_REGISTERS = 32

    # ========== Build ==========

    def __init__(self):

        # State bits
        self.ram_already_used = None  # Later
        self.loaded_op_next_cycle = virtual(1, None)

        # State registers
        self.reg_hold_intruction = MultiSourceReg(32)
        self.reg_has_hold = reg(self.loaded_op_next_cycle)
        self.reg_ram_is_source = MultiSourceReg(1)

        # Registers
        self.reg_pc = MultiSourceReg(32)
        self.registers = RegisterController(self.NB_REGISTERS, self.WORD)

        # Memory management
        self.ram = RamController(self.RAM_ADDR_SIZE, self.WORD)
        self.rom = RomController(self.ROM_ADDR_SIZE, self.WORD)
        self.memory = MemoryController(
            self.reg_ram_is_source, self.rom, self.ram)

        # Processor architecture
        self.op_controller = opctrl.OperationController(
            self, [opctrl.RiscvBase, opctrl.CustomExtension]
        )

    def generate(self, *input_args):
        self.in_vars = {desc[0]: val for desc,
                        val in zip(self.INPUTS, input_args)}
        self.in_vals = input_args

        # Move instruction pointer if needed
        self.reg_pc.add(~self.loaded_op_next_cycle,
                        self.adder(self.reg_pc.get(), bit(self.WORD // 8, size=self.WORD))[0])

        # Read and execute instruction
        instruction = self.build_read_instruction()
        self.build_intruction_decoder(instruction)
        self.build_update_state()

        return self.registers.read_reg(10, 1, bit(1, size=5))
        return instruction  # TODO

    def build(self):
        chip = hdl.Chip(self.generate,
                        inputs=[p[1] for p in self.INPUTS],
                        # outputs=[p[1] for p in self.OUTPUTS], # TODO
                        input_names=[p[0] for p in self.INPUTS],
                        output_names=[p[0] for p in self.INPUTS])
        return chip

    # ========== Build stages ==========

    # First stage : read the instruction
    def build_read_instruction(self):
        from_reg = self.reg_has_hold
        self.ram_already_used = self.reg_ram_is_source & (~from_reg)

        # Read the instruction from RAM / ROM
        self.memory.read_at(~from_reg, self.reg_pc)

        return mux(from_reg, self.memory.get(), self.reg_hold_intruction)

    # Second stage : decode the instruction to call the right function
    def build_intruction_decoder(self, op):
        self.op_controller.decode(op)
        # opcode = op[-7:]
        # operand1 = op[-12:-7]  # rd, first imm
        # operand2 = op[-15:-12]  # funct3
        # operand3 = op[-20:-15]  # rs1
        # operand4 = op[-25:-20]  # rs2
        # operand5 = op[-32:-25]  # func7, other imm

        # encodings = {  # From right to left, according to spec
        #     'R': (operand1, operand2, operand3, operand4, operand5),
        #     'I': (operand1, operand2, operand3, op[-32:-20]),
        #     'S': (operand1, operand2, operand3, operand4, operand5),
        #     'U': (operand1, op[-32:-12]),
        #     'B': (operand1[-1], operand1[:-1], operand2, operand3, operand4, operand5[1:], operand5[0]),
        #     'J': (operand1, op[-20:-12], op[-21:-20], op[-31:-21], op[-32:-31])
        # }
        # for code, operands in encodings.items():
        #     encodings[code] = tuple([concat(oper) for oper in operands])

        # # The decoder
        # decoder = RiscDecoder(opcode)
        # for code, encode_type, fct in self.get_op_maping():
        #     fct(decoder.get_control(code), *encodings[encode_type])

        # return opcode, encodings

    def build_update_state(self):
        self.loaded_op_next_cycle.set('0')  # TODO

    # ========== Operations ==========

    # def get_op_maping(self):
    #     return [
    #         ('0100000', 'U', self.op_wout)
    #     ]

    # ========== Computing functions ==========

    def adder(self, a, b, r='0'):
        return hdl.simple_adder(a, b, r)

    def incrementer(self, a):
        return hdl.increment(a)


if __name__ == "__main__":
    processor = Proc()
    chip = processor.build()
    chip.compile_netlist('__build__/riskv.net')
