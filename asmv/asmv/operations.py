from .util import AsmError, bin_add, hi_lo
from .riscasm import newop, multiop, format_bits


def int2b(val, size):
    return format_bits(str(val), size, 'bits', None)


def uint2b(val, size):
    return format_bits(str(val), size, True, None)


# ========== Base ISA ==========

# ---------- Integer-register


@newop('ADDI', 'reg', 'reg', 'int:12')
def op_addi(rd, rs1, imm):
    return ['0010011', rd, '000', rs1, imm]


@newop('SLTI', 'reg', 'reg', 'int:12')
def op_slti(rd, rs1, imm):
    """ Set lass than immediat : rd = 1 if rs1 < imm, else 0 """
    return ['0010011', rd, '010', rs1, imm]


@newop('SLTIU', 'reg', 'reg', 'uint:12')
def op_sltiu(rd, rs1, imm):
    """ SLTI but unsigned """
    return ['0010011', rd, '011', rs1, imm]


@newop('ANDI', 'reg', 'reg', 'int:12')
def op_andi(rd, rs1, imm):
    return ['0010011', rd, '111', rs1, imm]


@newop('ORI', 'reg', 'reg', 'int:12')
def op_ori(rd, rs1, imm):
    return ['0010011', rd, '110', rs1, imm]


@newop('XORI', 'reg', 'reg', 'int:12')
def op_xori(rd, rs1, imm):
    return ['0010011', rd, '100', rs1, imm]


@newop('SLLI', 'reg', 'reg', 'uint:5')
def op_slli(rd, rs1, imm):
    """ Logical left shift """
    return ['0010011', rd, '001', rs1, imm, '0000000']


@newop('SRLI', 'reg', 'reg', 'uint:5')
def op_srli(rd, rs1, imm):
    """ Logical right shift """
    return ['0010011', rd, '101', rs1, imm, '0000000']


@newop('SRAI', 'reg', 'reg', 'uint:5')
def op_srai(rd, rs1, imm):
    return ['0010011', rd, '101', rs1, imm, '0100000']


@newop('LUI', 'reg', 'bits:20')
def op_lui(rd, imm):
    """ rd <- imm . 000000000000 """
    return ['0110111', rd, imm]


@newop('AUIPC', 'reg', 'bits:20')
def op_auipc(rd, imm):
    """ rd <- pc + (imm . 000000000000) """
    return ['0010111', rd, imm]


# ---------- Register-Register


@newop('ADD', 'reg', 'reg', 'reg')
def op_add(rd, rs1, rs2):
    return ['0110011', rd, '000', rs1, rs2, '0000000']


@newop('SLT', 'reg', 'reg', 'reg')
def op_slt(rd, rs1, rs2):
    """ 1 if rs1 < rs2, else 0 """
    return ['0110011', rd, '010', rs1, rs2, '0000000']


@newop('SLTU', 'reg', 'reg', 'reg')
def op_sltu(rd, rs1, rs2):
    """ 1 if rs1 < rs2, else 0, unsigned """
    return ['0110011', rd, '011', rs1, rs2, '0000000']


@newop('AND', 'reg', 'reg', 'reg')
def op_and(rd, rs1, rs2):
    return ['0110011', rd, '111', rs1, rs2, '0000000']


@newop('OR', 'reg', 'reg', 'reg')
def op_or(rd, rs1, rs2):
    return ['0110011', rd, '110', rs1, rs2, '0000000']


@newop('XOR', 'reg', 'reg', 'reg')
def op_xor(rd, rs1, rs2):
    return ['0110011', rd, '100', rs1, rs2, '0000000']


@newop('SLL', 'reg', 'reg', 'reg')
def op_sll(rd, rs1, rs2):
    """ Logical left shift """
    return ['0110011', rd, '001', rs1, rs2, '0000000']


@newop('SRL', 'reg', 'reg', 'reg')
def op_srl(rd, rs1, rs2):
    """ Logical right shift """
    return ['0110011', rd, '101', rs1, rs2, '0000000']


@newop('SUB', 'reg', 'reg', 'reg')
def op_sub(rd, rs1, rs2):
    return ['0110011', rd, '000', rs1, rs2, '0100000']


# ---------- Control Transfer Instructions


@newop('JAL', 'reg', 'int:20')
def op_jal(rd, imm):
    """ Unconditional jump, offset imm, link into rd """
    return ['1101111', rd, imm]


@newop('JALR', 'reg', 'reg', 'int:12')
def op_jalr(rd, rs1, imm):
    """ Jump to rs1 + imm and link into rd """
    return ['1100111', rd, '000', rs1, imm]


# Conditional


@newop('BEQ', 'reg', 'reg', 'int:12')
def op_beq(src1, src2, imm):
    """ Branch on equal (src1 == src1) """
    return ['1100011', imm[:5], '000', src1, src2, imm[5:]]


@newop('BNE', 'reg', 'reg', 'int:12')
def op_bne(src1, src2, imm):
    """ Branch on src1 != src1 """
    return ['1100011', imm[:5], '001', src1, src2, imm[5:]]


@newop('BLT', 'reg', 'reg', 'int:12')
def op_blt(src1, src2, imm):
    """ Branch on src1 < src1 """
    return ['1100011', imm[:5], '100', src1, src2, imm[5:]]


@newop('BLTU', 'reg', 'reg', 'int:12')
def op_bltu(src1, src2, imm):
    """ Branch on src1 < src1, unsigned """
    return ['1100011', imm[:5], '110', src1, src2, imm[5:]]


@newop('BGE', 'reg', 'reg', 'int:12')
def op_bge(src1, src2, imm):
    """ Branch on src1 >= src1 """
    return ['1100011', imm[:5], '101', src1, src2, imm[5:]]


@newop('BGEU', 'reg', 'reg', 'int:12')
def op_bgeu(src1, src2, imm):
    """ Branch on src1 >= src1, unsigned """
    return ['1100011', imm[:5], '111', src1, src2, imm[5:]]


@newop('BGT', 'reg', 'reg', 'int:12')
def op_bgt(src1, src2, imm):
    """ Branch on src1 > src1 """
    return op_blt(src2, src1, imm)


@newop('BGTU', 'reg', 'reg', 'int:12')
def op_bgtu(src1, src2, imm):
    """ Branch on src1 > src1, unsigned """
    return op_bltu(src2, src1, imm)


@newop('BLE', 'reg', 'reg', 'int:12')
def op_ble(src1, src2, imm):
    """ Branch on src1 <= src1 """
    return op_bge(src2, src1, imm)


@newop('BLEU', 'reg', 'reg', 'int:12')
def op_bleu(src1, src2, imm):
    """ Branch on src1 <= src1, unsigned """
    return op_bgeu(src2, src1, imm)


# ---------- Load and Store Instructions

# Load


@newop('LW', 'reg', 'reg', 'int:12')
def op_load_lw(rd, rs1, offset):
    """ Load word (32 bits) """
    return ['0000011', rd, '010', rs1, offset]


@newop('LH', 'reg', 'reg', 'int:12')
def op_load_lh(rd, rs1, offset):
    """ Load word (16 bits [half], sign-extended) """
    return ['0000011', rd, '001', rs1, offset]


@newop('LHU', 'reg', 'reg', 'int:12')
def op_load_lhu(rd, rs1, offset):
    """ Load word (16 bits [half], 0-extended) """
    return ['0000011', rd, '101', rs1, offset]


@newop('LB', 'reg', 'reg', 'int:12')
def op_load_lb(rd, rs1, offset):
    """ Load word (8 bits [byte], sign-extended) """
    return ['0000011', rd, '000', rs1, offset]


@newop('LBU', 'reg', 'reg', 'int:12')
def op_load_lbu(rd, rs1, offset):
    """ Load word (8 bits [byte], 0-extended) """
    return ['0000011', rd, '100', rs1, offset]


# Store


@newop('SW', 'reg', 'reg', 'int:12')
def op_store_sw(addr, reg_data, offset):
    """ Stire word (32 bits) """
    return ['0100011', offset[:5], '010', addr, reg_data, offset[5:]]


@newop('SH', 'reg', 'reg', 'int:12')
def op_store_sh(addr, reg_data, offset):
    """ Stire word (16 bits [half]) """
    return ['0100011', offset[:5], '001', addr, reg_data, offset[5:]]


@newop('SB', 'reg', 'reg', 'int:12')
def op_store_sb(addr, reg_data, offset):
    """ Stire word (8 bits [byte]) """
    return ['0100011', offset[:5], '000', addr, reg_data, offset[5:]]


# ========== Base ISA pseudo-ops ==========


@newop('NOT', 'reg', 'reg')
def op_not(rd, rs1):
    return op_xori(rd, rs1, int2b('-1', 12))


@newop('NEG', 'reg', 'reg')
def op_neg(rd, rs1):
    return op_sub(rd, '00000', rs1)


@newop('MV', 'reg', 'reg')
def op_mv(rd, rs1):
    return op_addi(rd, rs1, int2b('0', 12))


@newop('NOP')
def op_nop():
    """ Do nothing. Litteraly """
    return op_addi('00000', '00000', int2b('0', 12))


@multiop('LI', 2, 'reg', 'bits:32')
def op_load_li(rd, imm):
    """ Load immediate """
    imm1, imm2 = hi_lo(imm)
    return (op_lui(rd, imm1), op_addi(rd, rd, imm2))


# Comparisons


@newop('SEQZ', 'reg', 'reg')
def op_seQz(rd, rs1):
    """ Set 1 iff rs1 = 0 """
    return op_sltiu(rd, rs1, int2b('1', 12))


@newop('SNEZ', 'reg', 'reg')
def op_snez(rd, rs1):
    """ Set 1 iff rs1 != 0 """
    return op_sltu(rd, '00000', rs1)


@newop('SLTZ', 'reg', 'reg')
def op_sltz(rd, rs1):
    """ Set 1 iff rs1 < 0 """
    return op_slt(rd, rs1, '00000')


@newop('SGTZ', 'reg', 'reg')
def op_sgtz(rd, rs1):
    """ Set 1 iff rs1 > 0 """
    return op_slt(rd, '00000', rs1)


# ---------- Control flow


@newop('J', 'int:20')
def op_jal_j(imm):
    return op_jal('00000', imm)


@newop('RET')
def op_ret():
    return op_jalr('00000', '00001', int2b('0', 12))


@newop('CALL', 'reg', 'int:20')
def op_call(reg_ret, addr):
    return op_jal(reg_ret, addr)


@newop('TAIL', 'int:20')
def op_tail(addr):
    return op_jal('00000', addr)


@newop('JR', 'reg')
def op_jr(rs1):
    return op_jalr('00000', rs1, '0' * 12)


# Branch


@newop('BEQZ', 'reg', 'int:12')
def op_beqz(src1, imm):
    return op_beq(src1, '00000', imm)


@newop('BNEZ', 'reg', 'int:12')
def op_bnez(src1, imm):
    return op_bne(src1, '00000', imm)


@newop('BLTZ', 'reg', 'int:12')
def op_bltz(src1, imm):
    return op_blt(src1, '00000', imm)


@newop('BLTUZ', 'reg', 'int:12')
def op_bltuz(src1, imm):
    return op_bltu(src1, '00000', imm)


@newop('BGEZ', 'reg', 'int:12')
def op_bgez(src1, imm):
    return op_bge(src1, '00000', imm)


@newop('BGEUZ', 'reg', 'int:12')
def op_bgeuz(src1, imm):
    return op_bgeu(src1, '00000', imm)


@newop('BGTZ', 'reg', 'int:12')
def op_bgtz(src1, imm):
    return op_bgt(src1, '00000', imm)


@newop('BGTUZ', 'reg', 'int:12')
def op_bgtuz(src1, imm):
    return op_bgtu(src1, '00000', imm)


@newop('BLEZ', 'reg', 'int:12')
def op_blez(src1, imm):
    return op_ble(src1, '00000', imm)


@newop('BLEUZ', 'reg', 'int:12')
def op_bleuz(src1, imm):
    return op_bleu(src1, '00000', imm)


# ========== M : Integer Multiplication / Division 2.0 ==========


def enableMExt(MUL_ENABLED=True, DIV_ENABLED=True):
    if MUL_ENABLED:

        @newop('MUL', 'reg', 'reg', 'reg')
        def op_mul(rd, rs1, rs2):
            return ['0110011', rd, '000', rs1, rs2, '0000001']

        @newop('MULHU', 'reg', 'reg', 'reg')
        def op_mulhu(rd, rs1, rs2):
            return ['0110011', rd, '011', rs1, rs2, '0000001']

        @newop('MULH', 'reg', 'reg', 'reg')
        def op_mulh(rd, rs1, rs2):
            return ['0110011', rd, '001', rs1, rs2, '0000001']

        @newop('MULHSU', 'reg', 'reg', 'reg')
        def op_mulhsu(rd, rs1, rs2):
            return ['0110011', rd, '010', rs1, rs2, '0000001']

    if DIV_ENABLED:

        @newop('DIV', 'reg', 'reg', 'reg')
        def op_div(rd, rs1, rs2):
            return ['0110011', rd, '100', rs1, rs2, '0000001']

        @newop('REM', 'reg', 'reg', 'reg')
        def op_rem(rd, rs1, rs2):
            return ['0110011', rd, '110', rs1, rs2, '0000001']

        @newop('DIVU', 'reg', 'reg', 'reg')
        def op_divu(rd, rs1, rs2):
            return ['0110011', rd, '101', rs1, rs2, '0000001']

        @newop('REMU', 'reg', 'reg', 'reg')
        def op_remu(rd, rs1, rs2):
            return ['0110011', rd, '111', rs1, rs2, '0000001']
