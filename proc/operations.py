import hdl
from hdl import reg, Bit, mux, concat, bit, RamOp
from hdl.blocks import MultiSourceReg, virtual, MultiControl

from memory import RamController, RomController, MemoryController
from decoder import RiscDecoder
import arith


class OperationController:
    def __init__(self, proc):
        self.proc = proc
        self.word_size = proc.WORD

        self.alu = arith.ALU(self.word_size, proc.adder)
        self.left_shifts = []
        self.right_shifts = []
        self.all_rd_writes = []

    def get_encodings(self, op):
        operand1 = op[-12:-7]  # rd, first imm
        operand2 = op[-15:-12]  # funct3
        operand3 = op[-20:-15]  # rs1
        operand4 = op[-25:-20]  # rs2
        operand5 = op[-32:-25]  # func7, other imm

        return (
            {  # From right to left, according to spec
                'R': (operand1, operand2, operand3, operand4, operand5),
                'I': (operand1, operand2, operand3, op[-32:-20]),
                'S': (operand1, operand2, operand3, operand4, operand5),
                'U': (operand1, op[-32:-12]),
                'B': (operand1[-1], operand1[:-1], operand2, operand3,
                      operand4, operand5[1:], operand5[0]),
                'J':
                (operand1, op[-20:-12], op[-21:-20], op[-31:-21], op[-32:-31])
            },
            [operand1, operand2, operand3, operand4, operand5])

    def decode_instruction(self, control, op):
        opcode = op[-7:]
        encodings, operands = self.get_encodings(op)
        self.precompute_base(op, operands)

        decoder = RiscDecoder(opcode)
        for code, encode_type, fct in self.get_op_mapping():
            fct(control & decoder.get_control(code), *encodings[encode_type])

        ###  Specific parts ###
        rd = operands[0]

        # Shifts
        (c1, dec1), (c2, dec2) = self.left_shifts
        result = arith.left_shift(self.reg_rs1, mux(c1, dec2, dec1))
        self.write_rd(c1 | c2, result)

        (c1, dec1, lead1), (c2, dec2, lead2) = self.right_shifts
        result = arith.right_shift(self.reg_rs1, mux(c1, dec2, dec1), False,
                                   mux(c1, lead2, lead1))
        self.write_rd(c1 | c2, result)

        ## Write in rd
        control = self.all_rd_writes[0][0]
        val = self.all_rd_writes[0][1]
        for c, v in self.all_rd_writes[1:]:
            control = control | c
            val = mux(c, val, v)
        self.proc.registers.write_reg(control, rd, val)

    def _decode(self, mapping, opcode, control, args):
        decoder = RiscDecoder(opcode)
        for code, fct in mapping:
            fct(control & decoder.get_control(code), *args)

    # Registers
    def read(self, reg_addr):
        return self.proc.registers.read_reg(reg_addr)

    def write_rd(self, control, val):
        self.all_rd_writes.append((control, val))

    # ========== Proc modules ==========
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
            ('1100011', 'S', self.op_branch),  # Standard is B
            ('0000011', 'I', self.op_load),
            ('0100011', 'S', self.op_store),
        ]

    def precompute_base(self, op, operands):
        rs1, rs2 = operands[2], operands[3]
        self.reg_rs1 = self.read(rs1)
        self.reg_rs2 = self.read(rs2)

    # ========== Integer Computational Instructions ==========

    # ---------- Integer Register-Immediate Instructions
    def op_op_reg_imm(self, control, rd, funct3, rs1, imm):
        self.imm_signed = hdl.sign_extend(self.word_size, imm)

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
        self._decode(mapping, funct3, control, [rd, rs1, imm])

    def op_addi(self, control, rd, rs1, imm):
        val = self.alu.add(control, self.reg_rs1,
                           hdl.sign_extend(self.word_size, imm))[0]
        self.write_rd(control, val)

    def op_slti(self, control, rd, rs1, imm):
        result = self.alu.first_less_than(control, self.reg_rs1, imm, False)
        self.write_rd(control, result)

    def op_sltiu(self, control, rd, rs1, imm):
        result = self.alu.first_less_than(control, self.reg_rs1, imm, True)
        self.write_rd(control, result)

    def op_andi(self, control, rd, rs1, imm):
        self.write_rd(control, self.reg_rs1 & self.imm_signed)

    def op_ori(self, control, rd, rs1, imm):
        self.write_rd(control, self.reg_rs1 | self.imm_signed)

    def op_xori(self, control, rd, rs1, imm):
        self.write_rd(control, self.reg_rs1 ^ self.imm_signed)

    def op_slli(self, control, rd, rs1, imm):
        self.left_shifts.append((control, imm[-5:]))
        # result = arith.left_shift(self.reg_rs1, imm[-5:])
        # self.write(0, control, rd, result)

    def op_srli_srai(self, control, rd, rs1, imm):
        lead_bit = imm[1] & self.reg_rs1[0]
        self.right_shifts.append((control, imm[-5:], lead_bit))
        # result = arith.right_shift(self.reg_rs1, imm[-5:], lead_bit)
        # self.write(0, control, rd, result)

    # ---------- Integer Register-Register Instructions
    def op_op_reg_reg(self, control, rd, funct3, rs1, rs2, funct7):
        self.op_reg_reg_standard(control & (~funct7[-1]), rd, funct3, rs1, rs2,
                                 funct7)
        self.op_m_ext(control & funct7[-1], rd, funct3, rs1, rs2)

    def op_reg_reg_standard(self, control, rd, funct3, rs1, rs2, funct7):
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

        self._decode(mapping, funct3, control, [rd, rs1, rs2, funct7])

    def op_add_sub(self, control, rd, rs1, rs2, funct7):
        val = self.alu.add(control, self.reg_rs1, self.reg_rs2, funct7[1])[0]
        self.write_rd(control, val)

    def op_slt(self, control, rd, rs1, rs2, func7):
        result = self.alu.first_less_than(control, self.reg_rs1, self.reg_rs2,
                                          False)
        self.write_rd(control, result)

    def op_sltu(self, control, rd, rs1, rs2, funct7):
        result = self.alu.first_less_than(control, self.reg_rs1, self.reg_rs2,
                                          True)
        self.write_rd(control, result)

    def op_and(self, control, rd, rs1, rs2, funct7):
        self.write_rd(control, self.reg_rs1 & self.reg_rs2)

    def op_or(self, control, rd, rs1, rs2, funct7):
        self.write_rd(control, self.reg_rs1 | self.reg_rs2)

    def op_xor(self, control, rd, rs1, rs2, funct7):
        self.write_rd(control, self.reg_rs1 ^ self.reg_rs2)

    def op_sll(self, control, rd, rs1, rs2, funct7):
        self.left_shifts.append((control, self.reg_rs2[-5:]))
        # result = arith.left_shift(self.reg_rs1, self.reg_rs2[-5:])
        # self.write(0, control, rd, result)

    def op_srl_sra(self, control, rd, rs1, rs2, funct7):
        lead_bit = funct7[1] & self.reg_rs1[0]
        self.right_shifts.append((control, self.reg_rs2[-5:], lead_bit))
        # result = arith.right_shift(self.reg_rs1, self.reg_rs2[-5:], lead_bit)
        # self.write(0, control, rd, result)

    # ---------- M standard extension for integer multiplication / division

    def op_m_ext(self, control, rd, funct3, rs1, rs2):
        if self.proc.MUL_ENABLED:
            # '000' -> mul
            # '011' -> mulhu
            # '001' -> mulh
            # '010' -> mulhsu
            mul_control = (~funct3[0]) & control
            hight_control = funct3[1] | funct3[2]

            sign1 = self.reg_rs1[0] & (funct3[1] ^ funct3[2])
            sign2 = self.reg_rs2[0] & (~funct3[1])

            num1 = hdl.extend(64, self.reg_rs1, sign1)
            num2 = hdl.extend(64, self.reg_rs2, sign2)
            m_ext_mul = hdl.simple_product(num1, num2)

            self.write_rd(mul_control & hight_control, m_ext_mul[:32])
            self.write_rd(mul_control & (~hight_control), m_ext_mul[-32:])

        if self.proc.DIV_ENABLED:
            # 100 -> div
            # 110 -> rem
            # 101 -> divu
            # 111 -> remu
            div_control = funct3[0] & control
            rem_control = funct3[1]
            is_signed = ~funct3[2]

            sign1 = is_signed & self.reg_rs1[0]
            sign2 = is_signed & self.reg_rs2[0]
            num1 = mux(sign1, self.reg_rs1, hdl.negative_of_int(self.reg_rs1))
            num2 = mux(sign2, self.reg_rs2, hdl.negative_of_int(self.reg_rs2))

            quotient, remainder = arith.simple_divide(num1, num2)
            quotient = mux(sign1 ^ sign2, quotient,
                           hdl.negative_of_int(quotient))
            remainder = mux(sign1, remainder, hdl.negative_of_int(remainder))

            self.write_rd(div_control & rem_control, remainder)
            self.write_rd(div_control & (~rem_control), quotient)

    # ========== Register operations ==========

    def op_lui(self, control, rd, imm):
        result = imm + bit(0, size=12)
        self.write_rd(control, result)

    def op_auipc(self, control, rd, imm):
        result = self.alu.add(control, self.proc.reg_pc,
                              imm + bit(0, size=12))[0]
        self.write_rd(control, result)

    # ========== Jumps ==========

    def op_jal(self, control, rd, offset):
        offset = hdl.sign_extend(self.word_size, offset)
        self.write_rd(control, self.proc.next_intruction_addr)
        jump_addr = self.alu.add(control, self.proc.reg_pc, offset)[0]
        self.proc.reg_pc.add(control, jump_addr)

    def op_jalr(self, control, rd, funct3, rs1_target, offset):
        self.write_rd(control, self.proc.next_intruction_addr)

        offset = hdl.sign_extend(self.word_size, offset)
        jump_addr = self.alu.add(control, self.reg_rs1, offset)[0]
        self.proc.reg_pc.add(control, jump_addr)

    # Conditional branch

    def op_branch(self, control, offset1, funct3, rs1_addr, rs2_addr, offset2):
        equality = ~hdl.merge_with_op(hdl.OrOp, self.reg_rs1 ^ self.reg_rs2)
        r1_m_r2 = self.alu.comp(control, self.reg_rs1, self.reg_rs2,
                                ~funct3[1])
        r = mux(funct3[0], equality, r1_m_r2[0])
        r = r ^ funct3[2]  # Invert if funct3[2] == 1

        offset = hdl.sign_extend(self.word_size, offset1 + offset2)
        # Don't use the ALU 2 times
        jump_addr = self.proc.adder(self.proc.reg_pc, offset)[0]
        self.proc.reg_pc.add(control & r, jump_addr)

    # ========== Memory ==========

    def op_load(self, control, rd, width, rs1, offset):
        # Implements LW, LH, LHU, LB, LBU
        addr = self.alu.add(control, self.reg_rs1,
                            hdl.sign_extend(self.word_size, offset))[0]
        result = self.proc.memory.read_at(control, addr)
        # First bit is 1 if unsigned
        r_16bits = mux(addr[-2], result[:16], result[16:])
        r_16bits_ext = hdl.extend(self.word_size, r_16bits,
                                  (~width[0]) & r_16bits[0])

        r_8bits = mux(addr[-1], r_16bits[:8], r_16bits[8:])
        r_8bits_ext = hdl.extend(self.word_size, r_8bits,
                                 (~width[0]) & r_8bits[0])
        result = mux(width[1], mux(width[2], r_8bits_ext, r_16bits_ext),
                     result)  # LW = 010, LH[U] = *01, LB[U] = *00

        self.write_rd(control, result)

    def op_store(self, control, offset1, width, rs1_dest, rs2_src, offset2):
        # Implements SW, SH, SB
        addr = self.alu.add(control, self.reg_rs1,
                            hdl.sign_extend(self.word_size,
                                            offset1 + offset2))[0]
        data_32 = self.reg_rs2  # SW : 010

        # Do not overwrite previous data
        prev = self.proc.memory.read_at(control & (~width[1]), addr)

        p1 = mux((~addr[-1]) & (~addr[-2]), prev[0:8], data_32[0:8])
        p2 = mux(addr[-1] & (~addr[-2]), prev[8:16], data_32[8:16])
        p3 = mux((~addr[-1]) & addr[-2], prev[16:24], data_32[16:24])
        p4 = mux(addr[-1] & addr[-2], prev[24:], data_32[24:])

        # SH : 001
        # SB : 000
        data_16 = mux(addr[-2], data_32[0:16] + prev[16:],
                      prev[0:16] + data_32[16:])
        data_8 = p1 + p2 + p3 + p4

        data = mux(width[1], mux(width[2], data_8, data_16), data_32)

        self.proc.memory.write_at(control, addr, data)
