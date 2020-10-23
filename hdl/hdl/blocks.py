from .wires import Bit, bit, mux, concat, Register, VirtualBit
from .util import BuildError
from .annotation import hdl_function

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


def virtual(size, block):
    if isinstance(block, BaseBlock):
        return BlockBit(size, block)
    elif block is None:
        return VirtualBit(size)
    elif isinstance(block, Bit):
        b = VirtualBit(size)
        b.set(block)
        return b
    else:
        raise BuildError(f"Can't build a virtual bit from {block}")


# ========== Blocks functions ==========

@hdl_function
def simple_adder(a: 'l', b: 'l', r: 'bit' = 0):
    """ Returns (a+b+r, remainder) """
    if len(a) == 0:
        return bit(), r
    else:
        x, y = a[0], b[0]
        prev, r = simple_adder(a[1:], b[1:], r)
        b = x ^ y ^ r
        r2 = (x & (y | r)) | (y & r)
        return (b + prev, r2)


@hdl_function
def increment(n: 'bus') -> (Bit, Bit):
    """ Returns (n+1, remainder) """
    n = bit(n)
    if len(n) == 0:
        return bit(), 1
    else:
        m, r = increment(n[1:])
        m = (n[0] ^ r) + m
        return m, (r & n[0])


@hdl_function
def negative_of_int(n: 'bus') -> Bit:
    return increment(~n)[0]


@hdl_function
def simple_product(n: 'l', m: 'l') -> (Bit, Bit):
    floors = [(n << i) & (m[-i - 1] * len(n)) for i in range(len(m))]
    while len(floors) > 1:
        stack = []
        while len(floors) > 1:
            stack.append(simple_adder(floors.pop(), floors.pop())[0])
        floors.extend(stack[::-1])
    return floors[0]


# ========== Blocks classes ==========

class BaseBlock:
    pass


class BuildableBlock(BaseBlock):
    pass


class MultiControl(BuildableBlock):
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

    @hdl_function
    def add(self, control: 'bit', value: 'bus'):
        control, bitvalue = bit(control), bit(value)
        assert len(control) == 1
        if self._inputs and len(bitvalue) != len(self._inputs[-1][1]):
            raise BuildError(
                f"The size of {repr(value)} ({len(bitvalue)}) doesn't match the previous bits sizes ({len(self._inputs[-1][1])})")

        self._inputs.append((control, bitvalue))

    def build(self):
        inputs = copy(self._inputs)
        if inputs == []:
            raise BuildError("MultiControl without inputs")
        c0, b0 = inputs[0]
        inputs[0] = (c0, (c0 * len(b0)) & b0)
        while len(inputs) > 1:
            stack = []
            while len(inputs) > 1:
                c1, b1 = inputs.pop()
                c0, b0 = inputs.pop()
                stack.append((c0 | c1, mux(c1, b0, b1)))
            inputs.extend(stack[::-1])
        return inputs[0][1]


class Multiplexer(BuildableBlock):
    def __init__(self, control=None, *args):
        """
            args : pairs of (control, value)
        """
        self.control = None
        self._inputs = []
        self.add(*args)
        self.plzshutup = False
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
                    f"The size of {repr(args[0])} ({len(val)}) doesn't match the previous bits sizes ({self.size()})")
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
        if 2 ** (len(self.control) - 1) >= len(inputs) and not self.plzshutup:
            print(
                f"[WARNING] Using a {len(self.control)} bits control for only {len(inputs)} inputs in a multiplexer. This is NOOOOOOONOPTIMAL")
        # inputs.extend([None] * (2 ** len(self.control) - len(inputs)))

        controls = list(self.control)
        fullzero = bit('0' * self.size())

        while len(inputs) > 1:
            control_bit = controls.pop()
            stack = []
            if len(inputs) % 2:
                inputs.append(None)

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

        while controls:  # Use the remainding bits
            inputs[0] = mux(controls.pop(), inputs[0], fullzero)

        return inputs[0]

# ========== Blocks usable as a bit ==========


class BlockBit(VirtualBit):
    """ VirtualBit that build the block automatically """

    def __init__(self, size, block, **kwargs):
        if not isinstance(block, BuildableBlock):
            raise BuildError(f"{block} is not a BuildableBlock")
        self.block = block
        self.block_built = False
        super().__init__(size, **kwargs)

    def build(self, chip, varname=None):
        if not self.block_built:
            self.block_built = True
            self.set(self.block.build())
        super().build(chip, varname)


class MultiSourceReg(VirtualBit, BuildableBlock):
    def __init__(self, size):
        super().__init__(size)
        self.reg = Register(size=size)
        self.multi = MultiControl(('1', self.reg))
        self.block_built = False

    def add(self, control, val):
        self.multi.add(control, val)

    def add_many(self, *args):
        self.multi.add_many(*args)

    def get(self):
        return self.reg

    def build(self, chip, varname=None):
        if not self.block_built:
            self.reg.source(self.multi.build())
            self.set(self.reg)
        super().build(chip, varname)
