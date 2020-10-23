from .util import AsmError, bin_add
from .riscasm import newop, multiop, format_bits


def int2b(val, size):
    return format_bits(str(val), size, False, None)


def uint2b(val, size):
    return format_bits(str(val), size, True, None)

# ========== Base ISA ==========

# ---------- Integer-register


@newop('ADDI', 'reg', 'reg', 'int:12')
def op_addi(rd, rs1, imm):
    return ['0010011', rd, '000', rs1, imm]


@newop('SLTI', 'reg', 'reg', 'int:12')
def op_slti(rd, rs1, imm):
    return ['0010011', rd, '010', rs1, imm]


@newop('SLTIU', 'reg', 'reg', 'uint:12')
def op_sltiu(rd, rs1, imm):
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
    return ['0010011', rd, '001', rs1, imm, '0000000']


@newop('SRLI', 'reg', 'reg', 'uint:5')
def op_srli(rd, rs1, imm):
    return ['0010011', rd, '101', rs1, imm, '0000000']


# TODO : not currently supported
# @newop('SRAI', 'reg', 'reg', 'uint:4')
# def op_srai(rd, rs1, imm):
#     return ['0010011', rd, '101', rs1, imm, '0100000']


@newop('LUI', 'reg', 'int:20')
def op_lui(rd, imm):
    """ rd <- imm . 000000000000 """
    return ['0110111', rd, imm]


@newop('AUIPC', 'reg', 'int:20')
def op_auipc(rd, imm):
    """ rd <- pc + (imm . 000000000000) """
    return ['0010111', rd, imm]

# ---------- Register-Register


@newop('ADD', 'reg', 'reg', 'reg')
def op_add(rd, rs1, rs2):
    return ['0110011', rd, '000', rs1, rs2, '0000000']


@newop('SLT', 'reg', 'reg', 'reg')
def op_slt(rd, rs1, rs2):
    return ['0110011', rd, '010', rs1, rs2, '0000000']


@newop('SLTU', 'reg', 'reg', 'reg')
def op_sltu(rd, rs1, rs2):
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
    return ['0110011', rd, '001', rs1, rs2, '0000000']


@newop('SRL', 'reg', 'reg', 'reg')
def op_srl(rd, rs1, rs2):
    return ['0110011', rd, '101', rs1, rs2, '0000000']


@newop('SUB', 'reg', 'reg', 'reg')
def op_sub(rd, rs1, rs2):
    return ['0110011', rd, '000', rs1, rs2, '0100000']


@newop('SRA', 'reg', 'reg', 'reg')
def op_sra(rd, rs1, rs2):
    return ['0110011', rd, '101', rs1, rs2, '0100000']

# ---------- Control Transfer Instructions


@newop('JAL', 'reg', 'int:20')
def op_jal(rd, imm):
    """ Unconditional jump """
    return ['1101111', rd, imm]


@newop('JALR', 'reg', 'reg', 'int:12')
def op_jalr(rd, rs1, imm):
    return ['1100111', rd, '000', rs1, imm]


@newop('BEQ', 'reg', 'reg', 'int:12')
def op_beq(src1, src2, imm):
    return ['1100011', imm[:5], '000', src1, src2, imm[5:]]


@newop('BNE', 'reg', 'reg', 'int:12')
def op_bne(src1, src2, imm):
    return ['1100011', imm[:5], '001', src1, src2, imm[5:]]


@newop('BLT', 'reg', 'reg', 'int:12')
def op_blt(src1, src2, imm):
    return ['1100011', imm[:5], '100', src1, src2, imm[5:]]


@newop('BLTU', 'reg', 'reg', 'int:12')
def op_bltu(src1, src2, imm):
    return ['1100011', imm[:5], '110', src1, src2, imm[5:]]


@newop('BGE', 'reg', 'reg', 'int:12')
def op_bge(src1, src2, imm):
    return ['1100011', imm[:5], '101', src1, src2, imm[5:]]


@newop('BGEU', 'reg', 'reg', 'int:12')
def op_bgeu(src1, src2, imm):
    return ['1100011', imm[:5], '111', src1, src2, imm[5:]]

# ---------- Load and Store Instructions


@newop('LW', 'reg', 'reg', 'int:12')
def op_load_lw(rd, rs1, offset):
    return ['0000011', rd, '010', rs1, offset]


@newop('SW', 'reg', 'reg', 'int:12')
def op_store_sw(addr, data, offset):
    return ['0100011', offset[:5], '010', addr, data, offset[5:]]

# TODO : other load / store intructions

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
    return op_addi('00000', '00000', int2b('0', 12))

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


@multiop('LI', 2, 'reg', 'uint:32')
def op_load_li(rd, imm):
    """ Load immediate """
    imm1, imm2 = imm[:20], imm[20:]
    if imm2[0] == '1':
        imm1 = bin_add(imm1, '1', 20)
    return (op_lui(rd, imm1), op_addi(rd, rd, imm2))

# TODO : branch, jump and link

# ========== M : Integer Multiplication / Division 2.0 ==========


# @newop('MUL', 'reg', 'reg', 'reg')
# def op_mul(rd, dest, left, right):
#     return ['0110011', rd, '000', left, right, '0000001']

# TODO


# ========== Custom ==========

# ---------- Pseudo-instructions

# @newop('RIN', 'rb', 'rb', 'int:??')
# def op_ret(dest, addr, offset):
#     return
