import copy
from collections.abc import Iterable

from .util import BuildError, memoization

# ========== bit factory functions ==========


def reg(n_or_var):
    if isinstance(n_or_var, int):
        return Register(size=n_or_var)
    return Register(n_or_var)


@memoization
def mux(control, false, true):
    if false is true:
        return true
    return MuxOp.on(control, false, true)


def rom(word_size: int, read_addr):
    read_addr = bit(read_addr)
    return RomOp(read_addr.size, word_size, read_addr)


def ram(word_size: int,
        read_addr,
        write_enable=None,
        write_addr=None,
        write_data=None):
    read_addr = bit(read_addr)
    if write_enable is None:
        write_enable = 0
        if write_addr is None:
            write_addr = '0' * read_addr.size
        if write_data is None:
            write_data = '0' * word_size
    return RamOp(read_addr.size, word_size, read_addr, write_enable,
                 write_addr, write_data)


@memoization
def concat(*elems, name=None):
    elems, rev = [], [bit(el) for el in elems][::-1]

    while rev:
        if len(rev[-1]) == 0:
            rev.pop()
        elif elems and isinstance(elems[-1], Constant) and isinstance(
                rev[-1], Constant):
            elems[-1] = Constant(elems[-1].get() + rev.pop().get())

        elif elems and isinstance(elems[-1], SubBusOp) and isinstance(
                rev[-1], SubBusOp):
            bus1, bus2 = elems[-1].get_bus(), rev[-1].get_bus()
            (i1, j1), (i2,
                       j2) = elems[-1].get_interval(), rev[-1].get_interval()
            if bus1 is bus2 and j1 == i2 - 1:
                elems[-1] = SliceOp.on(i1, j2, bus1)
                rev.pop()
            else:
                elems.append(rev.pop())
        elif isinstance(rev[-1], ConcatOp):
            elems.extend(rev.pop().args)
        else:
            elems.append(rev.pop())

    if len(elems) == 0:
        return bit()
    b = elems[0]
    if len(elems) > 1:
        b = ConcatOp(*elems)
    if b.name is None:
        b.name = name
    return b


@memoization
def bit(*args, size=None, name=None):
    """
        NB: size is only used when the argument is an int

        String : '0110'
        List of bits or ints (0 or 1)
        Single bit, single int, boolean (0 or 1)
        Int with size (0b0101, size=4 -> 0101)
    """
    def make_bit(*args, size=None):
        if len(args) == 0:
            return Bit(size=0)
        if len(args) > 1:
            args = [make_bit(a) for a in args]
            return concat(*args)
        else:
            val = args[0]
            if isinstance(val, Bit):
                return val
            elif isinstance(val, str):
                return Constant(val)
            elif is_real_iterable(val):
                return make_bit(*val)
            elif isinstance(val, bool):
                return Constant(str(int(val)))
            elif isinstance(val, int):
                size = 1 if size is None else size
                bits = []
                for _ in range(size):
                    bits.append(str(val % 2))
                    val //= 2
                return Constant(''.join(bits[::-1]))
            else:
                raise BuildError(f"Can't convert {val} to a bit or bus")

    b = make_bit(*args, size=size)
    if b.name is None:
        b.name = name
    return b


# ========== Bit utility functions ==========


def is_real_iterable(obj):
    return isinstance(obj, Iterable) and not isinstance(obj, Bit)


@memoization
def on_word_op(op_cls, *operands):
    for b in operands:
        if not isinstance(b, Bit) or len(b) != 1:
            raise BuildError(
                f"The operation {op_cls.__name__} must be used on single bits")
    return op_cls(*operands)


@memoization
def merge_with_op(op, args):
    if len(args) <= 1:
        return args[0]
    left, right = args[:len(args) // 2], args[len(args) // 2:]
    left, right = merge_with_op(op, left), merge_with_op(op, right)
    return op.on(left, right)


def op_on_builder(f):
    """
        Convert to classmethod, and ensure that if there is a constant
        argument, this is the right argument
    """
    def on(cls, left, right):
        left, right = bit(left), bit(right)
        # if len(left) != 1 or len(right) != 1:
        #     raise BuildError("Binary operation on bus of size != 1")
        if isinstance(left, Constant) and not isinstance(right, Constant):
            return f(cls, right, left)
        return f(cls, left, right)

    return classmethod(on)


# ========== Head bits ==========


class Bit:
    # Create a bit / bus
    def __init__(self, size=None, cells=None, name=None):
        if size is None:
            size = (len(cells) if cells is not None else 1)
        self.size = size
        self.name = name

        if cells is not None:
            self.cells = cells
        else:
            self.init_cells_self()

    def init_cells_self(self):
        if self.size > 1:
            self.cells = [SelectOp(i, self) for i in range(self.size)]
        else:
            self.cells = [self]

    # Methods

    def to_bits(self):
        return copy.copy(self.cells)

    def slice(self, i, j):
        return SliceOp(i, j, self)

    # Build the chip wires

    def build(self, chip, varname=None):
        if not id(self) in chip.ids_to_varname:
            varname = chip.new_varname(varname or self.name)
            chip.ids_to_varname[id(self)] = varname
            chip.varname_to_bits[varname] = self

            return True

    def get_name(self, chip):
        return chip.ids_to_varname[id(self)]

    def name_size(self, chip):
        if self.size == 1:
            return self.get_name(chip)
        return f'{self.get_name(chip)} : {self.size}'

    def has_operation(self):
        return False

    # Operators

    def __and__(self, other):
        return AndOp.on(self, bit(other))

    def __or__(self, other):
        return OrOp.on(self, bit(other))

    def __xor__(self, other):
        return XorOp.on(self, bit(other))

    def __pow__(self, other):
        return NandOp.on(self, bit(other))

    def __rand__(self, other):
        return AndOp.on(bit(other), self)

    def __ror__(self, other):
        return OrOp.on(bit(other), self)

    def __rxor__(self, other):
        return XorOp.on(bit(other), self)

    def __rpow__(self, other):
        return NandOp.on(bit(other), self)

    def __invert__(self):
        return NotOp.on(self)

    def __len__(self):
        return self.size

    def __getitem__(self, key):
        return self.cells[key]

    def __iter__(self):
        return self.cells.__iter__()

    def __add__(self, other):
        return concat(self, other)

    def __radd__(self, other):
        return concat(other, self)

    def __mul__(self, n: int):  # Duplicate the bit(s)
        if isinstance(n, Bit):
            return self * len(n)
        return concat(list(self) * n)

    def __rmul__(self, n: int):
        return concat(list(self) * n)

    def __lshift__(self, n):
        if n < 0:
            return self >> (-n)
        return concat(self[n:], '0' * min(n, self.size))

    def __rshift__(self, n):
        if n <= 0:
            return self << (-n)
        return concat('0' * min(n, self.size), self[:-n])

    def get_repr(self, *args):
        args = [
            f'{self.__class__.__module__}.{self.__class__.__qualname__}',
            f'size={len(self)}'
        ] + list(args)
        return '<' + ' '.join(args) + '>'

    def __repr__(self):
        return self.get_repr()


class Constant(Bit):
    """
        Used as an operant in an operation
        See SimpleBit for a constant variable
    """
    def __init__(self, value: str, **kwargs):
        if (not isinstance(value, str)
                or value.count('0') + value.count('1') != len(value)):
            raise BuildError(
                "A constant must me built from a string of 0 and 1")
        self._value = str(value)
        if len(value) == 1:
            cells = [self]
        else:
            cells = [Constant(c) for c in value]
        super().__init__(size=len(value), cells=cells, **kwargs)

    def get(self):
        return self._value

    def is_only(self, val):
        return self._value == val * len(self._value)

    def get_name(self, chip):
        return str(self.get())

    def build(self, chip, varname=None):
        return True

    def get_repr(self, *args):
        return super().get_repr(f'val={self._value}', *args)


class InputVar(Bit):
    def __init__(self, size=1, **kwargs):
        super().__init__(size=size, **kwargs)


# ========== Operations ==========


class Operation(Bit):
    KEYWORD = ""
    PARTIAL_INIT = False  # If None can be used as an arg
    ARGS_TYPE = []  # 'int' or 'bus' (>=1 bits), 'bit' (=1 bit)

    def __init__(self, args, **initargs):
        super().__init__(**initargs)
        self.args = args
        self.check_args(self.PARTIAL_INIT)

    def check_args(self, none_is_ok):
        cls_name = self.__class__.__name__
        args_types = self.ARGS_TYPE
        if args_types == 'bus':
            args_types = ['bus'] * len(self.args)

        if len(args_types) != len(self.args):
            raise BuildError(
                f"The operation {cls_name} need {len(args_types)} arguments but {len(self.args)} are provided"
            )
        for i_arg, (arg, arg_type) in enumerate(zip(self.args, args_types)):
            if arg is None and none_is_ok:
                continue
            if arg_type == 'int' and not isinstance(arg, int):
                raise BuildError(
                    f"The argument {i_arg} of {cls_name} must be a static integer"
                )
            if arg_type in ['bit', 'bus'] and not isinstance(arg, Bit):
                try:
                    arg = bit(arg)
                    self.args[i_arg] = arg
                except BuildError:
                    raise BuildError(
                        f"The argument {i_arg} of {cls_name} must be an bit or a bus"
                    )
            if arg_type == 'bit' and len(arg) != 1:
                raise BuildError(
                    f"The argument {i_arg} of {cls_name} must be a single bit")

    def build(self, chip, varname=None):
        if super().build(chip, varname):
            self.check_args(False)
            for b in self.args:
                if isinstance(b, Bit):
                    b.build(chip)
            return True

    def operation(self, chip):
        parts = [self.get_name(chip), '=']
        if self.KEYWORD:
            parts.append(self.KEYWORD)
        parts += [
            b.get_name(chip) if isinstance(b, Bit) else str(b)
            for b in self.args
        ]
        return ' '.join(parts)

    def has_operation(self):
        return True


class Assign(Operation):
    """
        Force the creation of a variable.
        Avoid using in most cases (mostly usefull for the output of a constant).
        It is not optimized for ANY operation.
    """
    KEYWORD = ""
    ARGS_TYPE = ['bus']

    def __init__(self, value, **kwargs):
        value = bit(value)
        super().__init__([value], size=value.size, **kwargs)
        if self.name is None:
            self.name = value.name


class Register(Operation):
    KEYWORD = "REG"
    PARTIAL_INIT = True  # We can initialize a register later (with source)
    ARGS_TYPE = ['bus']

    def __init__(self, var=None, size=None, **kwargs):
        """ Can be initialized later with source """
        if var is None and size is None:
            size = 1
        elif var is not None:
            var = bit(var)
            if size is not None and var.size != size:
                raise BuildError(
                    "The size of 'var' is not the same as the given size")
            size = var.size
        super().__init__([var], size=size, **kwargs)

    def source(self, var):
        var = bit(var)
        if var.size != self.size:
            raise BuildError("Invalid size of 'var'")
        self.args = [var]


class MuxOp(Operation):
    ARGS_TYPE = ['bit', 'bus', 'bus']
    PARTIAL_INIT = True
    KEYWORD = 'MUX'

    def __init__(self, control, false, true, **kwargs):
        super().__init__([control, false, true],
                         size=bit(false).size,
                         **kwargs)

    @staticmethod
    def on(control, false, true):
        control = bit(control)
        if len(control) == 1 and isinstance(control, Constant):
            if control.get() == '0':
                return bit(false)
            return bit(true)
        return MuxOp(control, false, true)

    def set_control(self, control):
        self.args[0] = control

    def check_args(self, none_is_ok):
        super().check_args(none_is_ok)
        if self.args[1].size != self.args[2].size:
            raise BuildError(
                "The two arguments of a MUX operations must have the same size"
            )


class NotOp(Operation):
    ARGS_TYPE = ['bus']
    KEYWORD = 'NOT'

    def __init__(self, val, **kwargs):
        super().__init__([val], size=val.size, **kwargs)

    @staticmethod
    def on(val):
        val = bit(val)
        if isinstance(val, AndOp):
            return NandOp(val.args[0], val.args[1])
        if isinstance(val, NandOp):
            return AndOp(val.args[0], val.args[1])
        if isinstance(val, NotOp):
            return val.args[0]
        if isinstance(val, Constant):
            return ''.join(['0' if c == '1' else '1' for c in val.get()])
        return NotOp(val)


# Binary operations


class BinOperation(Operation):
    ARGS_TYPE = ['bus', 'bus']

    def __init__(self, left, right, **kwargs):
        left, right = bit(left), bit(right)
        if len(left) != len(right):
            raise BuildError(
                "The two arguments of a binary operation must have the same size"
            )
        super().__init__([left, right], size=left.size, **kwargs)


class OrOp(BinOperation):
    KEYWORD = "OR"

    @op_on_builder
    def on(cls, left, right):
        if isinstance(right, Constant):
            if right.is_only('0'):
                return left
            if right.is_only('1'):
                return right
            if isinstance(left, Constant):
                return bit(''.join([
                    '1' if x == '1' or y == '1' else '0'
                    for (x, y) in zip(left.get(), right.get())
                ]))
        if left is right:
            return left
        return OrOp(left, right)


class XorOp(BinOperation):
    KEYWORD = "XOR"

    @op_on_builder
    def on(cls, left, right):
        if isinstance(right, Constant):
            if right.is_only('0'):
                return left
            if right.is_only('1'):
                return ~left
            if isinstance(left, Constant):
                return bit(''.join([
                    '1' if x != y else '0'
                    for (x, y) in zip(left.get(), right.get())
                ]))
        if left is right:
            return bit('0' * len(left))
        return XorOp(left, right)


class AndOp(BinOperation):
    KEYWORD = "AND"

    @op_on_builder
    def on(cls, left, right):
        if isinstance(right, Constant):
            if right.is_only('0'):
                return right
            if right.is_only('1'):
                return left
            if isinstance(left, Constant):
                return bit(''.join([
                    '1' if x == '1' and y == '1' else '0'
                    for (x, y) in zip(left.get(), right.get())
                ]))
        if left is right:
            return left
        return AndOp(left, right)


class NandOp(BinOperation):
    KEYWORD = "NAND"

    @op_on_builder
    def on(cls, left, right):
        if isinstance(right, Constant):
            if right.is_only('0'):
                return bit('1' * len(right))
            if right.is_only('1'):
                return ~left
            if isinstance(left, Constant):
                return bit(''.join([
                    '1' if x == '0' or y == '0' else '0'
                    for (x, y) in zip(left.get(), right.get())
                ]))
        if left is right:
            return ~left
        return NandOp(left, right)


# ========== Bus Operations ==========


class SubBusOp:
    def get_bus(self):
        raise NotImplementedError()

    def get_interval(self):
        raise NotImplementedError()


class SelectOp(Operation, SubBusOp):
    KEYWORD = "SELECT"
    ARGS_TYPE = ['int', 'bus']

    def __init__(self, i, arr, **kwargs):
        super().__init__([i, arr], **kwargs)

    def check_args(self, none_is_ok):
        super().check_args(none_is_ok)
        i, arr = self.args
        if len(arr) == 1:
            print("WARNING: SelectOp on a bus of size 1 is just so stupid")
        if not (0 <= i < len(arr)):
            raise BuildError(
                f"SelectOp: the id {i} must be between 0 and {len(arr)-1}")

    def get_bus(self):
        return self.args[1]

    def get_interval(self):
        return (self.args[0], self.args[0])


class SliceOp(Operation, SubBusOp):
    KEYWORD = "SLICE"
    ARGS_TYPE = ['int', 'int', 'bus']

    def __init__(self, i, j, arr, **kwargs):  # i and j are inclusive
        arr = bit(arr)
        if len(arr) == 1:
            print("WARNING: SliceOp on a bus of size 1 is REALLY sensless")
        if not (0 <= i <= j < len(arr)):
            raise BuildError(
                f"SelectOp: the id {i} must be between 0 and {len(arr)-1}")

        super().__init__([i, j, arr], cells=arr.cells[i:j + 1], **kwargs)

    def get_bus(self):
        return self.args[2]

    def get_interval(self):
        return (self.args[0], self.args[1])

    @classmethod
    def on(cls, i, j, arr):
        arr = bit(arr)
        if i == 0 and j == len(arr) - 1:
            return arr
        return SliceOp(i, j, arr)


class ConcatOp(Operation):
    KEYWORD = 'CONCAT'
    ARGS_TYPE = 'bus'

    def __init__(self, *args, **kwargs):
        args = [bit(a) for a in args]
        cells = []
        for a in args:
            for c in a:
                cells.append(c)

        super().__init__(args, cells=cells, **kwargs)


# ========== ROM and RAM ==========


class RomOp(Operation):
    KEYWORD = 'ROM'
    ARGS_TYPE = ['int', 'int', 'bus']

    def __init__(self, addr_size: int, word_size: int, read_addr, **kwargs):
        """
            read_addr : len == addr_size
            output : len == word_size
        """
        super().__init__([addr_size, word_size, read_addr],
                         size=word_size,
                         **kwargs)

    def read_at(self, read_addr):
        self.args[2] = read_addr

    def check_args(self, none_is_ok):
        super().check_args(none_is_ok)
        if len(self.args[2]) != self.args[0]:
            raise BuildError(
                f'ROM: Size of {repr(self.args[2])} (read_addr) is not {self.args[0]}'
            )


class RamOp(Operation):
    KEYWORD = 'RAM'
    PARTIAL_INIT = True
    ARGS_TYPE = ['int', 'int', 'bus', 'bit', 'bus', 'bus']

    def __init__(self,
                 addr_size: int,
                 word_size: int,
                 read_addr,
                 write_enable=False,
                 write_addr=None,
                 write_data=None,
                 **kwargs):
        """
            read_addr : len == addr_size
            output : len == word_size

            write_enable : 0 or 1 (True / False work), or a bit
            write_addr : len == addr_size
            write_data : len == word_size

            Always return the value of the previous cycle.
            If write enable is set to false, write_addr and write_data can be ignored
        """

        super().__init__([
            addr_size, word_size, read_addr, write_enable, write_addr,
            write_data
        ],
                         size=word_size,
                         **kwargs)

    def read_at(self, read_addr):
        self.args[2] = read_addr

    def write(self, write_enable, write_addr, write_data):
        self.args[3] = write_enable
        self.args[4] = write_addr
        self.args[5] = write_data

    def check_args(self, none_is_ok):
        super().check_args(none_is_ok)
        if not none_is_ok:
            if len(self.args[2]) != self.args[0]:
                raise BuildError(
                    f'RAM: Size of {repr(self.args[2])} (read_addr) is {len(self.args[2])}, but should be {self.args[0]}'
                )
            if len(self.args[4]) != self.args[0]:
                raise BuildError(
                    f'RAM: Size of {repr(self.args[4])} (write_addr) is {len(self.args[4])}, but should be {self.args[0]}'
                )
            if len(self.args[5]) != self.args[1]:
                raise BuildError(
                    f'RAM: Size of {repr(self.args[5])} (write_data) is {len(self.args[5])}, but should be {self.args[1]}'
                )


# ========== Other ==========


class VirtualBit(Bit):
    """
        Feed this bit with an input later. Be careful : is prevent optimizations
    """
    def __init__(self, size, **kwargs):
        super().__init__(size, **kwargs)
        self.child = None

    def set(self, val):
        val = bit(val)
        if len(val) != self.size:
            raise BuildError(
                f"This VirtualBit must be set with an input of size {self.size}, not {len(val)}"
            )
        self.child = val

    def get(self):
        return self.child

    def build(self, chip, varname=None):
        if self.child is None:
            raise BuildError(f"The VirtualBit {varname} has not been set")
        return self.child.build(chip)

    def get_name(self, chip):
        return self.child.get_name(chip)
