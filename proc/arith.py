import hdl
from hdl import reg, Bit, BitRegister, mux, concat, bit, RamOp
from hdl.blocks import MultiSourceReg, virtual, MultiControl


def left_shift(bits, shift, invert=False):
    shift = list(shift)
    k = -1 if invert else 1
    while shift:
        bits = mux(shift.pop(), bits, bits << k)
        k *= 2
    return bits


def first_less_than(mod, first, second, unsigned=False):
    if unsigned:
        first = hdl.extend(mod.word_size + 1, first)
        second = hdl.extend(mod.word_size + 1, second)
    else:
        first = hdl.sign_extend(mod.word_size + 1, first)
        second = hdl.sign_extend(mod.word_size + 1, second)
    val = mod.proc.adder(
        first,
        hdl.negative_of_int(second)
    )[0]
    return '0' * (mod.word_size - 1) + val[0]  # Bit sign
