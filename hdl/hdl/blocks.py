from .wires import Bit, bit, mux, concat
from .util import BuildError

from copy import copy

"""
    Blocks are helpers that CONTAINS bits, but they can't be used as bits
    You must call the 'build' function on block classes to generate
        if you want a bit representation
"""

# ========== factory functions ==========


def multicontrol(*args):
    return MultiControl(*args).build()


def multiplex(control, *args):
    return MultiControl(control, *args).build()


# ========== Blocks functions ==========

def simple_adder(a, b, r=0):
    assert len(a) == len(b)
    if len(a) == 0 == len(b):
        return bit(), r
    else:
        x, y = a[0], b[0]
        prev, r = simple_adder(a[1:], b[1:], r)
        b = x ^ y ^ r
        r2 = (x & (y | r)) | (y & r)
        return (b + prev, r2)


def increment(n):
    if len(n) == 0:
        return bit(), 1
    else:
        m, r = increment(n[1:])
        m = (n[0] ^ r) + m
        return m, (r & n[0])


def negative_of_int(n):
    return increment(~n)


# ========== Blocks classes ==========

class BaseBlock:
    pass


class MultiControl(BaseBlock):
    def __init__(self, *args):
        """
            args : pairs of (control, value)
        """
        self._inputs = []
        self.add_many(*args)

    def add_many(self, *args):
        for control, value in args:
            self.add(control, value)

    def size(self):
        return len(self._inputs[-1])

    def add(self, control, value):
        control, bitvalue = bit(control), bit(value)
        assert len(control) == 1
        if self._inputs and len(bitvalue) != len(self._inputs[-1][1]):
            raise BuildError(
                f"The size of {repr(value)} doesn't match the previous bits sizes")

        self._inputs.append((control, bitvalue))

    def build(self):
        inputs = copy(self._inputs)
        if inputs == []:
            raise BuildError("MultiControl without inputs")
        while len(inputs) > 1:
            stack = []
            while len(inputs) > 1:
                c1, b1 = inputs.pop()
                c0, b0 = inputs.pop()
                stack.append((c0 | c1, mux(c1, b0, b1)))
            inputs.extend(stack[::-1])
        return inputs[0][1]


class Multiplexer(BaseBlock):
    def __init__(self, control=None, *args):
        """
            args : pairs of (control, value)
        """
        self.control = None
        self._inputs = []
        self.add(*args)
        if control is not None:
            self.set_control(control)

    def size(self):
        return len(self._inputs[0])

    def set_control(self, control):
        self.control = bit(control)

    def add(self, *args):
        if len(args) == 1:
            val = bit(args[0])
            if self._inputs and self.size() != len(val):
                raise BuildError(
                    f"The size of {repr(args[0])} doesn't match the previous bits sizes")
            self._inputs.append(val)
        else:
            for a in args:
                self.add(a)

    def build(self):
        inputs = copy(self._inputs)
        assert isinstance(self.control, Bit)
        if inputs == []:
            raise BuildError("Multiplexer without inputs")

        if 2 ** len(self.control) < len(inputs):
            raise BuildError(
                f"Too many inputs ({len(inputs)}) for control of size {len(self.control)}")
        if 2 ** (len(self.control) - 1) >= len(inputs):
            print(
                f"[WARNING] Using a {len(self.control)} bits control for only {len(inputs)} inputs in a multiplexer. This is NOOOOOOONOPTIMAL")
        inputs.extend([None] * (2 ** len(self.control) - len(inputs)))

        controls = list(self.control)
        fullzero = bit('0' * self.size())

        while len(inputs) > 1:
            control_bit = controls.pop()
            stack = []
            while len(inputs):
                b1 = inputs.pop()
                b0 = inputs.pop()
                if b0 is None and b1 is None:
                    stack.append(None)
                else:
                    if b1 is None:
                        b1 = fullzero
                    stack.append(mux(control_bit, b0, b1))
            inputs.extend(stack[::-1])

        return inputs[0]
