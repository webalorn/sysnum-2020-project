import hdl
from hdl import reg, Bit, mux, concat, bit, RamOp
from hdl.blocks import MultiSourceReg, virtual, MultiControl


def left_shift(bits, shift, invert=False):
    shift = list(shift)
    k = -1 if invert else 1
    while shift:
        bits = mux(shift.pop(), bits, bits << k)
        k *= 2
    return bits


def right_shift(bits, shift, invert=False, lead_bit=bit('0')):
    if invert:
        return left_shift(bits, shift)

    lead = lead_bit
    shift = list(shift)
    k = 1
    while shift:
        bits = mux(shift.pop(), bits, lead + bits[:-k])
        k *= 2
        lead = lead + lead
    return bits


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
        quotient_up, dividend_up = do_division(dividend, divisor << 1,
                                               step + 1)
        # Don't overflow
        dividend = mux(divisor[1], dividend_up, dividend)
        quotient = mux(divisor[1], quotient_up, bit(0, size=len(quotient_up)))

        sub = hdl.simple_adder(dividend, hdl.negative_of_int(divisor))[0]
        return (mux(sub[0], quotient + '1',
                    quotient + '0'), mux(sub[0], sub, dividend))

    quotient, remain = do_division(dividend, divisor, 0)
    remain = remain[1:]
    remain = mux(sign, remain, hdl.negative_of_int(remain))
    return quotient[1:], remain


# ========== Blocks ==========


class ALU:
    def __init__(self, size, adder_function):
        self.input1 = MultiControl()
        self.input2 = MultiControl()
        self.inv = virtual(1, bit(0))
        self.signed = virtual(1, bit(0))
        self.word_size = size

        operand1 = virtual(size, self.input1)
        operand1 = mux(
            self.signed,
            hdl.extend(size + 1, operand1),
            hdl.sign_extend(size + 1, operand1),
        )

        operand2 = virtual(size, self.input2)
        operand2 = mux(
            self.signed,
            hdl.extend(size + 1, operand2),
            hdl.sign_extend(size + 1, operand2),
        )
        operand2 = mux(self.inv, operand2, hdl.negative_of_int(operand2))
        self.num_result, self.carry = adder_function(operand1, operand2)
        self.result = self.num_result[1:], self.num_result[0]

    def get(self, i):
        return self.result[i]

    def add(self, control, left, right, inv=None):
        self.input1.add(control, left)
        self.input2.add(control, right)
        if inv is not None:
            inv = bit(inv)
            self.inv.set((control & inv) | self.inv.get())
        return self.result

    def comp(self, control, first, second, signed):
        self.signed.set(self.signed.get() | (control & signed))
        if len(second) < self.word_size:
            second = mux(signed, hdl.extend(self.word_size, second),
                         hdl.sign_extend(self.word_size, second))
        self.add(control, first, second, True)
        return self.num_result[0]

    def first_less_than(self, control, first, second, unsigned=False):
        r = self.comp(control, first, second, bit(not unsigned))
        return '0' * (self.word_size - 1) + r
