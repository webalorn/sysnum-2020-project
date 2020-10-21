import functools


class BuildError(Exception):
    pass


def memoization(fct):
    mem = {}

    def arg_repr(v):
        from .wires import Bit
        if isinstance(v, Bit):
            return ('id', id(v))
        if isinstance(v, list):
            return ('list', tuple(v))
        return ('val', v)

    @functools.wraps(fct)
    def wrapped_fct(*args, **kwargs):
        arg_vals = (
            tuple([arg_repr(v) for v in args]),
            tuple([(name, arg_repr(val)) for name, val in kwargs.items()])
        )
        if arg_vals not in mem:
            mem[arg_vals] = fct(*args, **kwargs)
        return mem[arg_vals]
    return wrapped_fct
