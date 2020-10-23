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
            ('0010011', 'I', self.op_op_reg_imm),
            ('0110011', 'R', self.op_op_reg_reg),
            ('0110111', 'U', self.op_lui),
            ('0010111', 'U', self.op_auipc),
            ('1101111', 'U', self.op_jal),  # Standard is J
            ('1100111', 'I', self.op_jalr),
            ('1100011', 'S', self.op_branch)  # Standard is B
        ]

    # ========== Integer Computational Instructions ==========

    # ---------- Integer Register-Immediate Instructions
    def op_op_reg_imm(self, control, rd, funct3, rs1, imm):
        mapping = [
            ('000', self.op_addi),
            ('010', self.op_slti),  # comparison
            ('011', self.op_sltiu),
            ('111', self.op_andi),  # Binary
            ('110', self.op_ori),
            ('100', self.op_xori),
            ('001', self.op_slli),  # Shifting
            ('101', self.op_srli_srai),
        ]
        self.decode(mapping, funct3, control, [rd, rs1, imm])

    def op_addi(self, control, rd, rs1, imm):
        val = self.proc.adder(
            self.read(0, control, rs1),
            hdl.sign_extend(self.word_size, imm)
        )[0]
        self.write(0, control, rd, val)

    def op_slti(self, control, rd, rs1, imm):
        result = arith.first_less_than(
            self, self.read(0, control, rs1), imm, False)
        self.write(0, control, rd, result)

    def op_sltiu(self, control, rd, rs1, imm):
        result = arith.first_less_than(
            self, self.read(0, control, rs1), imm, True)
        self.write(0, control, rd, result)

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

    def op_srli_srai(self, control, rd, rs1, imm):
        rs1_val = self.read(0, control, rs1)
        result = arith.left_shift(rs1_val, imm[-5:], invert=True)
        self.write(0, control, rd, result)
        # TODO : SRAI

    # ---------- Integer Register-Register Instructions
    def op_op_reg_reg(self, control, rd, funct3, rs1, rs2, funct7):
        mapping = [
            ('000', self.op_add_sub),
            ('010', self.op_slt),  # comparison
            ('011', self.op_sltu),
            ('111', self.op_and),  # Binary
            ('110', self.op_or),
            ('100', self.op_xor),
            ('001', self.op_sll),  # Shifting
            ('101', self.op_srl_sra),
        ]
        self.decode(mapping, funct3, control, [rd, rs1, rs2, funct7])

    def op_add_sub(self, control, rd, rs1, rs2, funct7):
        val2 = self.read(1, control, rs2)
        val2 = mux(funct7[1], val2, hdl.negative_of_int(val2))
        val = self.proc.adder(self.read(0, control, rs1), val2)[0]
        self.write(0, control, rd, val)

    def op_slt(self, control, rd, rs1, rs2, func7):
        result = arith.first_less_than(
            self, self.read(0, control, rs1),
            self.read(1, control, rs2), False)
        self.write(0, control, rd, result)

    def op_sltu(self, control, rd, rs1, rs2, funct7):
        result = arith.first_less_than(
            self, self.read(0, control, rs1),
            self.read(1, control, rs2), True)
        self.write(0, control, rd, result)

    def op_and(self, control, rd, rs1, rs2, funct7):
        rs1_val = self.read(0, control, rs1)
        rs2_val = self.read(1, control, rs2)
        self.write(0, control, rd, rs1_val & rs2_val)

    def op_or(self, control, rd, rs1, rs2, funct7):
        rs1_val = self.read(0, control, rs1)
        rs2_val = self.read(1, control, rs2)
        self.write(0, control, rd, rs1_val | rs2_val)

    def op_xor(self, control, rd, rs1, rs2, funct7):
        rs1_val = self.read(0, control, rs1)
        rs2_val = self.read(1, control, rs2)
        self.write(0, control, rd, rs1_val ^ rs2_val)

    def op_sll(self, control, rd, rs1, rs2, funct7):
        rs1_val = self.read(0, control, rs1)
        rs2_val = self.read(1, control, rs2)
        result = arith.left_shift(rs1_val, rs2_val[-5:])
        self.write(0, control, rd, result)

    def op_srl_sra(self, control, rd, rs1, rs2, funct7):
        rs1_val = self.read(0, control, rs1)
        rs2_val = self.read(1, control, rs2)
        result = arith.left_shift(rs1_val, rs2_val[-5:], invert=True)
        self.write(0, control, rd, result)
        # TODO : SRA

    # ========== Register operations ==========

    def op_lui(self, control, rd, imm):
        result = imm + bit(0, size=12)
        self.write(0, control, rd, result)

    def op_auipc(self, control, rd, imm):
        result = self.proc.adder(
            self.proc.reg_pc_value,
            imm + bit(0, size=12)
        )[0]
        self.write(0, control, rd, result)

    # ========== Jumps ==========

    def op_jal(self, control, rd, offset):
        offset = hdl.sign_extend(self.word_size, offset)
        self.write(0, control, rd, self.proc.next_intruction_addr)
        jump_addr = self.proc.adder(self.proc.reg_pc_value, offset)[0]
        self.proc.reg_pc.add(control, jump_addr)

    def op_jalr(self, control, rd, funct3, rs1_target, offset):
        self.write(0, control, rd, self.proc.next_intruction_addr)

        offset = hdl.sign_extend(self.word_size, offset)
        jump_addr = self.proc.adder(self.read(0, control, rs1_target),
                                    offset)[0]
        self.proc.reg_pc.add(control, jump_addr)

    def op_branch(self, control, offset1, funct3, rs1, rs2, offset2):
        offset = offset1 + offset2
        rs1 = self.read(0, control, rs1)
        rs2 = self.read(1, control, rs2)

        equality = ~hdl.merge_with_op(hdl.OrOp, rs1 ^ rs2)


class CustomExtension(OpModule):
    """
        Custom extension
        WOUT, RIN
    """

    def get_op_mapping(self):
        return [
            # ('0100000', 'U', self.op_wout)
        ]

    def op_wout(self, control, rd, imm):
        pass
        # TODO
