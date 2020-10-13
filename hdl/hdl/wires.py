import copy
from collections.abc import Iterable

from .util import BuildError


# ========== Head bits ==========

class Bit:
    def __init__(self, *kargs, **kwargs):
        raise NotImplementedError(
            f"{self.__class__.__name__} is a virtual class")

    def __and__(self, other):
        return AndOp(self, self.from_val(other))

    def __or__(self, other):
        return OrOp(self, self.from_val(other))

    def __xor__(self, other):
        return XorOp(self, self.from_val(other))

    def __pow__(self, other):
        return NandOp(self, self.from_val(other))

    def __rand__(self, other):
        return AndOp(self.from_val(other), self)

    def __ror__(self, other):
        return OrOp(self.from_val(other), self)

    def __rxor__(self, other):
        return XorOp(self.from_val(other), self)

    def __rpow__(self, other):
        return NandOp(self.from_val(other), self)

    def __add__(self, other):
        return BitArr.from_bits(self) + other

    def __invert__(self):
        return XorOp(self, ConstBit(1))

    def __len__(self):
        return 1

    def from_val(self, val):
        if isinstance(val, int):
            return ConstBit(val)
        elif isinstance(val, Bit):
            return val
        else:
            raise BuildError(f"{repr(val)} is not a bit or an integer")

    def build(self, chip, varname=None):
        if not id(self) in chip.ids_to_varname:
            varname = chip.new_varname(varname)
            chip.ids_to_varname[id(self)] = varname
            chip.varname_to_bits[varname] = self

            return True

    def name(self, chip):
        return chip.ids_to_varname[id(self)]

    def name_size(self, chip):
        return self.name(chip)

    def has_operation(self):
        return False


class ConstBit(Bit):
    """
        Used as an operant in an operation
        See SimpleBit for a constant variable
    """

    def __init__(self, value):
        self._value = 1 if value else 0

    def get(self):
        return self._value

    def name(self, chip):
        return str(self.get())

    def build(self, chip, varname=None):
        pass


class InputBit(Bit):
    def __init__(self):
        pass

# ========== Operations ==========


class Operation(Bit):
    KEYWORD = None
    UNARY_WIRES = True

    def __init__(self):
        self.args = []
        super().__init__()

    def build(self, chip, varname=None):
        # self.args = [b if isinstance(b, Bit) else ConstBit(b)
        #              for b in self.args]
        if super().build(chip, varname):
            for b in self.args:
                if isinstance(b, Bit):
                    b.build(chip)

    def operation(self, chip):
        parts = [self.name(chip), '=']
        if self.UNARY_WIRES:
            for w in self.args:
                if not isinstance(w, Bit) or len(w) != 1:
                    raise BuildError(
                        f"The operation {self.__class__.__name__} must be used on single bits, not array or list of bits")
        if self.KEYWORD:
            parts.append(self.KEYWORD)
        parts += [
            b.name(chip) if isinstance(b, Bit) else str(b)
            for b in self.args
        ]
        return ' '.join(parts)

    def has_operation(self):
        return True


class SimpleBit(Operation):
    KEYWORD = ""
    UNARY_WIRES = False

    def __init__(self, value):
        value = 1 if value else 0
        self.args = [str(value)]


class Register(Operation):
    KEYWORD = "REG"
    UNARY_WIRES = False

    def __init__(self, var):
        """ Can be initialized later with source """
        self.args = [var]

    def source(self, var):
        self.args = [var]


class SelectOp(Operation):
    KEYWORD = "SELECT"
    UNARY_WIRES = False

    def __init__(self, i, arr):
        self.args = [i, arr]
        self.shallow = (i == 0 and len(arr) == 1)

    def name(self, chip):
        if self.shallow:
            return self.args[1].name(chip)
        else:
            return super().name(chip)

    def has_operation(self):
        return not self.shallow


# Binary operations


class BinOperation(Operation):
    def __init__(self, left, right):
        self.args = [left, right]


class OrOp(BinOperation):
    KEYWORD = "OR"


class XorOp(BinOperation):
    KEYWORD = "XOR"


class AndOp(BinOperation):
    KEYWORD = "AND"


class NandOp(BinOperation):
    KEYWORD = "NAND"


# ========== Bit Array ==========

class BitArr(Bit):
    def __init__(self, size):
        self.size = size
        self.cells = [SelectOp(i, self) for i in range(size)]

    def to_bits(self):
        return copy.copy(self.cells)

    @classmethod
    def from_bits(cls, bits):
        """
            String : '0110'
            List of bits or ints (0 or 1)
            Single bit, single int (0 or 1)
        """
        if isinstance(bits, str):
            bits = [int(c == '1') for c in bits]
            return ConstBitArr(len(bits), bits)
        elif isinstance(bits, BitArr):
            return bits
        elif isinstance(bits, Iterable) and len(bits) == 1:
            return Singleton(bits[0])
        elif isinstance(bits, Bit) or isinstance(bits, int):
            return Singleton(bits)
        elif isinstance(bits, Iterable):
            return ConcatOp(bits[0], bits[1:])
        else:
            raise BuildError(f"Can't convert {bits} to a bit array (bus)")

    def name_size(self, chip):
        return f'{self.name(chip)} : {self.size}'

    def concat(self, other):
        return ConcatOp(self, self.from_bits(other))

    def __len__(self):
        return self.size

    def __getitem__(self, key):
        return self.cells[key]

    def __iter__(self):
        return self.cells.__iter__()

    def __add__(self, other):
        return self.concat(other)


class Singleton(BitArr):
    def __init__(self, val):
        if isinstance(val, Iterable):
            val = val[0]
        if isinstance(val, int):
            val = ConstBit(val)
        super().__init__(1)
        self.cells = [val]

    def build(self, *a, **b):
        return self.cells[0].build(*a, **b)

    def name(self, *a, **b):
        return self.cells[0].name(*a, **b)

    def operation(self, *a, **b):
        return self.cells[0].operation(*a, **b)

    def has_operation(self, *a, **b):
        return self.cells[0].has_operation(*a, **b)


class ConstBitArr(BitArr, Operation):
    KEYWORD = ""

    def __init__(self, size, val):
        super().__init__(size)
        binrepr = self.to_binrepr(val)
        self.args = [''.join([str(d) for d in binrepr])]

    def to_binrepr(self, val):
        if isinstance(val, Iterable):
            if len(val) != self.size:
                raise BuildError(
                    "The size of the ConstBitArr doesn't match the initializing list size")
            return [int(bool(val[i])) for i in range(self.size)]
        elif isinstance(val, int):
            bits = []
            for _ in range(self.size):
                bits.append(val % 2)
                val //= 2
            return bits[::-1]
        else:
            raise BuildError("No valid value for ConstBitArr")

    def operation(self, chip):
        print(self, self.args)
        return ' '.join([self.name(chip), '='] + self.args)


class ConcatOp(BitArr, Operation):
    KEYWORD = 'CONCAT'
    UNARY_WIRES = False

    def __init__(self, left, right):
        left = BitArr.from_bits(left)
        right = BitArr.from_bits(right)
        self.args = [left, right]

        super().__init__(len(left) + len(right))
        self.cells = left.cells + right.cells


# ========== ROM and RAM ==========

class RomOp(BitArr, Operation):
    KEYWORD = 'ROM'
    UNARY_WIRES = False

    def __init__(self, addr_size: int, word_size: int, read_addr):
        """
            read_addr : len == addr_size
            output : len == word_size
        """
        super().__init__(word_size)
        self.args = [addr_size, word_size, self.word_of(addr_size, read_addr)]

    def word_of(self, size, arr):
        bitarr = BitArr.from_bits(arr)
        if len(bitarr) != size:
            raise BuildError(f'Size of {repr(arr)} is not {size}')
        return bitarr


class RamOp(RomOp):
    KEYWORD = 'RAM'
    UNARY_WIRES = False

    def __init__(self, addr_size: int, word_size: int, read_addr,
                 write_enable, write_addr=None, write_data=None):
        """
            read_addr : len == addr_size
            output : len == word_size

            write_enable : 0 or 1 (True / False work), or a bit
            write_addr : len == addr_size
            write_data : len == word_size

            Always return the value of the previous cycle.
            If write enable is set to false, write_addr and write_data can be ignored
        """
        if not isinstance(write_enable, Bit):
            write_enable = int(bool(write_enable))
            if not write_enable:
                write_addr = read_addr
                write_data = ConstBitArr(word_size, 0)

        super().__init__(addr_size, word_size, read_addr)
        self.args.extend([
            write_enable, self.word_of(addr_size, write_addr),
            self.word_of(word_size, write_data)
        ])
