import inspect
import copy


class NoDefault:
    pass


class HdlFunctionError(Exception):
    pass


class Bit:
    pass


class Arg:
    """
        An HDL function using an Arg default will receive the value instead of a bit
    """
    def __init__(default=NoDefault):
        self.default = default


def f(fct):
    f_name = fct.__name__
    sig = inspect.signature(fct)
    args_def = [(a.name, a.default) for a in list(sig.parameters.values())]

    # Replace args with no default or with an integer default by a bit
    for i, (aname, adef) in enumerate(args_def):
        if isinstance(adef, int):
            args_def[i] = (aname, Bit(adef))
        elif adef is inspect._empty:
            args_def[i] = (aname, Bit(1))
        elif not isinstance(adef, Arg):
            args_def[i] = (aname, Arg(adef))

    def hdl_fct(*args, **kwargs):
        # Check the args
        kwargs = copy.copy(kwargs)
        for i, value in enumerate(args):
            if i >= len(args):
                raise HdlFunctionError(
                    f"Too many positional arguments for {f_name}")
            argname = args_def[i][0]
            if argname in kwargs:
                raise HdlFunctionError(
                    f"The argument {argname} is defined two times")
            kwargs[argname] = value

        # if sig.parameters.keys() != kwargs.keys():
        #     raise HdlFunctionError(f"Wrong arguments for {f_name}")
        for key in kwargs:
            if key not in sig.parameters:
                raise HdlFunctionError(f"The argument {key} doesn't exists")

        for aname, adef in args_def:
            if aname not in kwargs:
                if isinstance(adef, Bit):
                    raise HdlFunctionError(
                        f"The bit argument {aname} is required")
                elif adef.default is NoDefault:
                    raise HdlFunctionError(
                        f"The static argument {aname} is required")
                else:
                    kwargs[aname] = adef.default
            elif isinstance(adef, Bit) and not isinstance(kwargs[aname]):
                raise HdlFunctionError(f"The argument {aname} must be a bit")

        return fct(**kwargs)

    return hdl_fct
