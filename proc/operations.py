import hdl
from hdl import reg, Bit, BitRegister, mux, concat, bit, RamOp
from hdl.blocks import MultiSourceReg, virtual, MultiControl

from memory import RamController, RomController, MemoryController, RegisterController
from decoder import RiscDecoder
import arith


class OpModule:
    def __init__(self, proc):
        self.proc = proc
        self.word_size = proc.WORD

    def get_op_mapping(self):
        raise NotImplementedError()

    def decode(self, mapping, opcode, control, args):
        decoder = RiscDecoder(opcode)
        for code, fct in mapping:
            fct(control & decoder.get_control(code), *args)

    # Registers
    def read(self, i, control, reg_addr):
        return self.proc.registers.read_reg(i, control, reg_addr)

    def write(self, i, control, reg_addr, val):
        return self.proc.registers.write_reg(i, control, reg_addr, val)


class OperationController:
    def __init__(self, proc, modules):
        self.proc = proc
        self.modules = [mod(proc) for mod in modules]

    def get_encodings(self, op):
        operand1 = op[-12:-7]  # rd, first imm
        operand2 = op[-15:-12]  # funct3
        operand3 = op[-20:-15]  # rs1
        operand4 = op[-25:-20]  # rs2
        operand5 = op[-32:-25]  # func7, other imm

        return {  # From right to left, according to spec
            'R': (operand1, operand2, operand3, operand4, operand5),
            'I': (operand1, operand2, operand3, op[-32:-20]),
            'S': (operand1, operand2, operand3, operand4, operand5),
            'U': (operand1, op[-32:-12]),
            'B': (operand1[-1], operand1[:-1], operand2, operand3, operand4, operand5[1:], operand5[0]),
            'J': (operand1, op[-20:-12], op[-21:-20], op[-31:-21], op[-32:-31])
        }

    def decode(self, op):
        opcode = op[-7:]
        encodings = self.get_encodings(op)

        decoder = RiscDecoder(opcode)
        for mod in self.modules:
            for code, encode_type, fct in mod.get_op_mapping():
                fct(decoder.get_control(code), *encodings[encode_type])

# ========== Proc modules ==========


class RiscvBase(OpModule):
    """
        RiscV standard (RV32I base integer IS, 2.1)
    """

    def get_op_mapping(self):
        return [
            ("0010011", 'I', self.op_op_imm)
        ]

    # ========== Integer Computational Instructions ==========

    # Integer Register-Immediate Instructions
    def op_op_imm(self, control, rd, funct3, rs1, imm):
        mapping = [
            ('000', self.op_addi),
            ('010', self.op_slti),  # comparison
            ('011', self.op_sltiu),
            ('111', self.op_andi),  # Binary
            ('110', self.op_ori),
            ('100', self.op_xori),
            # ('SLLI', self.op_slli),  # Shifting
            # ('SRLI', self.op_srli),
            # ('SRAI', self.op_srai),
        ]
        self.decode(mapping, funct3, control, [rd, rs1, imm])

    def op_addi(self, control, rd, rs1, imm):
        val = self.proc.adder(
            self.read(0, control, rs1),
            hdl.sign_extend(self.word_size, imm)
        )[0]
        self.write(0, control, rd, val)

    def op_slti(self, control, rd, rs1, imm):
        imm_val = hdl.sign_extend(self.word_size + 1, imm)
        rs1_val = hdl.sign_extend(
            self.word_size + 1, self.read(0, control, rs1))
        val = self.proc.adder(
            imm_val,
            hdl.negative_of_int(rs1_val)
        )[0]
        result = '0' * (self.word_size - 1) + val[0]  # Bit sign
        self.write(0, control, rd, result)

    def op_sltiu(self, control, rd, rs1, imm):
        imm_val = hdl.extend(self.word_size + 1, imm)
        return self.op_slti(control, rd, rs1, imm_val)

    def op_andi(self, control, rd, rs1, imm):
        imm_val = hdl.sign_extend(self.word_size, imm)
        rs1_val = self.read(0, control, rs1)
        self.write(0, control, rd, rs1_val & imm_val)

    def op_ori(self, control, rd, rs1, imm):
        imm_val = hdl.sign_extend(self.word_size, imm)
        rs1_val = self.read(0, control, rs1)
        self.write(0, control, rd, rs1_val | imm_val)

    def op_xori(self, control, rd, rs1, imm):
        imm_val = hdl.sign_extend(self.word_size, imm)
        rs1_val = self.read(0, control, rs1)
        self.write(0, control, rd, rs1_val ^ imm_val)

    def op_slli(self, control, rd, rs1, imm):
        rs1_val = self.read(0, control, rs1)
        result = arith.left_shift(rs1_val, imm[-5:])
        self.write(0, control, rd, result)


class CustomExtension(OpModule):
    """
        Custom extension
        WOUT, RIN
    """

    def get_op_mapping(self):
        return [
            ('0100000', 'U', self.op_wout)
        ]

    def op_wout(self, control, rd, imm):
        pass
        # TODO
