from .wires import Bit, bit
from .util import BuildError

import functools
import inspect


class BitType:
    # args : None (any size), int (bit of size ...), string (same size as...)
    def __init__(self, size=None):
        if not (size is None or isinstance(size, int) or isinstance(size, str)):
            raise BuildError(
                "The size of a bit in BitType must be specified either by a string or an int, or left to None")
        self.size = size

    def check(self, name, val, named_sizes):
        val = bit(val)
        if isinstance(self.size, int):
            if len(val) != self.size:
                raise BuildError(f'{name} should be a bit of size {self.size}')
        elif isinstance(self.size, str):
            if len(val) != named_sizes.get(self.size, len(val)):
                raise BuildError(
                    f"{name} should be of size {named_sizes[self.size]} (set by {self.size})")
            named_sizes[self.size] = len(val)
        elif self.size is not None:
            raise BuildError("[INTERNAL]")
        return val

    @classmethod
    def _check_and_convert(cls, arg_name, arg_val, annotation, named_sizes):
        if isinstance(annotation, BitType):
            return annotation.check(arg_name, arg_val, named_sizes)
        elif annotation and not isinstance(arg_val, annotation):
            raise BuildError(
                f"{arg_name}: {arg_val} should be of type {annotation}")
        return arg_val

    @classmethod
    def check_types(cls, arg_types, binding):
        PAR = inspect.Parameter
        named_sizes = {}

        for arg_name, arg_val in binding.arguments.items():
            annotation, kind = arg_types[arg_name]
            if kind == PAR.VAR_KEYWORD:
                arg_val_list = {key: cls._check_and_convert(
                    arg_name, val, annotation, named_sizes) for key, val in arg_val.items()}
            elif kind == PAR.VAR_POSITIONAL:
                arg_val = [cls._check_and_convert(
                    arg_name, val, annotation, named_sizes) for val in arg_val]
            else:
                arg_val = cls._check_and_convert(
                    arg_name, arg_val, annotation, named_sizes)
            binding.arguments[arg_name] = arg_val


# Access to the type representation of a bit from 'Bit'
Bit.t = BitType


def hdl_function(fct):
    """
        Supported type annotations :
        bit (function), Bit (class), BitType -> bus of any size (from 0 to +inf)
        BitType(n : int) -> bit / bus of size n
        BitType(name : str) -> all bits / bus with type BitType(name) have the same size

        n : int -> BitType(n)
        name : str -> BitType(n)
        'bit' -> BitType(1)
        'bus' -> BitType()
        int, str -> integer, string

        Any other type annotation will be ignored and won't be checked at runtime.
        For BitType, convertion will happen if possible.
    """
    f_name = fct.__name__
    sig = inspect.signature(fct)
    arg_types = {}
    for p in sig.parameters.values():
        annotation = p.annotation
        if annotation == inspect._empty:
            annotation = None
        elif annotation == bit or annotation == Bit or annotation == BitType:
            annotation = BitType()
        elif annotation == 'bit':  # Single bit
            annotation = BitType(1)
        elif annotation == 'bus':  # Multiple bits
            annotation = BitType()
        elif isinstance(annotation, int) or isinstance(annotation, str):
            annotation = BitType(annotation)
        elif annotation not in [int, str]:
            annotation = None

        arg_types[p.name] = (annotation, p.kind)

    @functools.wraps(fct)
    def wrapped_fct(*args, **kwargs):
        try:
            binding = sig.bind(*args, **kwargs)
            binding.apply_defaults()
        except TypeError:
            raise BuildError(f"Invalid parameters for {f_name}")
        BitType.check_types(arg_types, binding)

        return fct(*binding.args, **binding.kwargs)
    return wrapped_fct
