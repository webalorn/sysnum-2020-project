from .wires import OrOp, AndOp, XorOp, NandOp, Register, BitArr, Bit, RamOp, RomOp
from .util import bit_vetorize, BuildError


@bit_vetorize
def bor(b1, b2):
    return b1 | b2


@bit_vetorize
def band(b1, b2):
    return b1 & b2


@bit_vetorize
def bxor(b1, b2):
    return b1 ^ b2


@bit_vetorize
def bnand(b1, b2):
    return b1 ** b2


@bit_vetorize
def reg(b):
    return Register(b)


def bus(l):
    return BitArr.from_bits(l)


def const(val):
    """
        Automaticaly infers the size from the value
        Warning : it can cause problems (can't use leading 0 with ints)
    """
    raise NotImplementedError()


def concat(left, *right):
    if isinstance(left, list) or isinstance(left, tuple):
        left = BitArr.from_bits(left)
    elif not isinstance(left, Bit):
        raise BuildError(f"{repr(left)} should be a bit or a list of bits")
    if len(right) == 0:
        return left
    return left + concat(right[0], *right[1:])


def rom_read(addr_size: int, word_size: int, read_addr):
    return RomOp(addr_size, word_size, read_addr)


def ram_read(addr_size: int, word_size: int, read_addr):
    return RamOp(addr_size, word_size, read_addr, 0)


def ram_write(addr_size: int, word_size: int, write_addr=None, write_data=None):
    """ Also return the old value where the RAM is written """
    return RamOp(addr_size, word_size, write_addr, 1, write_addr, write_data)
