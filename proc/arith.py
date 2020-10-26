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


def right_shift(bits, shift, invert=False):
    return left_shift(bits, shift, not invert)


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


@hdl.f
def simple_neg(a: 'l', b: 'l', r: 'bit' = 0):
    """ Returns a-b-r """
    def do_substract(i, r):
        if i < 0:
            return [], r
        else:
            x, y = a[i], b[i]
            v = x ^ y ^ r
            r = ((~x) & (y | r)) | (y & r)

            prev, r = do_substract(i - 1, r)
            prev.append(v)
            return (prev, r)
    n, r = do_substract(len(a) - 1, r)
    return concat(n), r


@hdl.f
def simple_divide(dividend: 'l', divisor: 'l') -> (Bit, Bit):
    """ Returns (quotient, remainder) """
    sign = dividend[0] ^ divisor[0]
    dividend = '0' + mux(dividend[0], dividend, hdl.negative_of_int(dividend))
    divisor = '0' + mux(divisor[0], divisor, hdl.negative_of_int(divisor))

    def do_division(dividend, divisor, step):
        if step >= len(dividend):
            return (bit(size=0), dividend)
        quotient_up, dividend_up = do_division(
            dividend, divisor << 1, step + 1)
        # Don't overflow
        dividend = mux(divisor[1], dividend_up, dividend)
        quotient = mux(divisor[1], quotient_up, bit(0, size=len(quotient_up)))

        # print("Division step", step)
        sub = hdl.simple_adder(
            dividend,
            hdl.negative_of_int(divisor)
        )[0]
        # sub = simple_neg(dividend, divisor)[0]
        # print('added')
        return (mux(sub[0], quotient + '1', quotient + '0'),
                mux(sub[0], sub, dividend))

    quotient, remain = do_division(dividend, divisor, 0)
    remain = remain[1:]
    remain = mux(sign, remain, hdl.negative_of_int(remain))
    return quotient[1:], remain
