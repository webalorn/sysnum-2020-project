from collections.abc import Iterable


class BuildError(Exception):
    pass


def bit_vetorize(f):
    def fct(*args):
        if all([isinstance(a, Iterable) for a in args]):
            return type(args[0])([f(*v) for v in zip(*args)])
        return f(*args)
    return fct
