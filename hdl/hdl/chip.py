from collections.abc import Iterable
import random

from .wires import Bit, InputBit, Operation, BitArr, SimpleBit, ConstBit
from .util import BuildError


def islistlike(l):
    return isinstance(l, Iterable) and not isinstance(l, BitArr)


class Chip:
    def __init__(self, generator, inputs, outputs=None, input_names=[], output_names=[]):
        """
            Parameters : function, tuple of int, tuple of int
            The size 0 (or None) means a single bit, while a size of 1 creates
            a list containing one bit
        """
        self.ids_to_varname = {}
        self.varname_to_bits = {}

        self.input = [
            BitArr(n) if n else InputBit()
            for n in inputs
        ]
        self.output = generator(*self.input)
        if not islistlike(self.output):
            self.output = [self.output]

        for i, b in enumerate(self.output):  # Convert output lists to bits
            if islistlike(b):
                self.output[i] = BitArr.from_bits(b)
            elif not isinstance(b, Bit):
                self.output[i] = SimpleBit(b)
            elif isinstance(b, ConstBit):
                self.output[i] = SimpleBit(b)

        if outputs is not None:  # If the output format is defined, check it
            if len(self.output) != len(outputs):
                raise BuildError(
                    "The number of output bits retuned doesn't match the output given to the chip")
            for i, (b1, n) in enumerate(zip(self.output, outputs)):
                if n and (not isinstance(b1, BitArr) or len(b1) != n):
                    raise BuildError(
                        f"The output {i} must be a list of size {n}")
                elif not n and isinstance(b1, BitArr) and len(b1) == 1:
                    self.output[i] = b1[0]
                elif not n and (not isinstance(b1, Bit) or isinstance(b1, BitArr)):
                    raise BuildError(f"The output {i} must be a single bit")

        for i, b in enumerate(self.input):
            b.build(self, input_names[i] if i < len(input_names) else None)
        for i, b in enumerate(self.output):
            b.build(self, output_names[i] if i < len(output_names) else None)

    def new_varname(self, varname=None):
        if varname is None:
            varname = 'var_' + str(len(self.ids_to_varname))
        suffix = ''
        while varname + suffix in self.ids_to_varname:
            suffix = '_' + \
                str(random.randint(0, 10 * len(self.ids_to_varname)))
        return varname

    # ---------- Conversion

    def to_netlist_repr(self):
        return {
            'input': [b.name(self) for b in self.input],
            'output': [b.name(self) for b in self.output],
            'var': [b.name_size(self) for b in self.varname_to_bits.values()],
            'operations': [b.operation(self) for b in self.varname_to_bits.values()
                           if b.has_operation()]
        }

    def to_netlist(self):
        net = self.to_netlist_repr()
        lines = [
            'INPUT {}'.format(', '.join(net['input'])),
            'OUTPUT {}'.format(', '.join(net['output'])),
            'VAR',
            ', '.join(net['var']),
            'IN',
            *net['operations']
        ]
        return ''.join([l + '\n' for l in lines])

    def compile_netlist(self, file):
        print(self.ids_to_varname)
        with open(file, 'w') as f:
            f.write(self.to_netlist())
