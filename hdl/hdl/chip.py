import random

from .wires import bit, Bit, InputVar, Constant, Assign, is_real_iterable
from .util import BuildError


class Chip:
    def __init__(self, generator, inputs, outputs=None, input_names=[], output_names=[]):
        """
            Parameters : function, tuple of int, tuple of int
            A size of 0 or None will be transformed to 1
            a list containing one bit
        """
        self.ids_to_varname = {}
        self.varname_to_bits = {}

        self.input = [InputVar(n) for n in inputs]
        self.output = generator(*self.input)
        if not is_real_iterable(self.output):
            self.output = [self.output]
        else:
            self.output = list(self.output)

        for i, b in enumerate(self.output):  # Convert output lists to bits
            if is_real_iterable(b):
                b = bit(b)
                self.output[i] = b
            if not isinstance(b, Bit) or isinstance(b, Constant):
                self.output[i] = Assign(bit(b))

        if outputs is not None:  # If the output format is defined, check it
            if len(self.output) != len(outputs):
                raise BuildError(
                    "The number of output bits retuned doesn't match the output given to the chip")
            for i, (b1, n) in enumerate(zip(self.output, outputs)):
                if not isinstance(b1, Bit) or len(b1) != n:
                    raise BuildError(
                        f"The output {i} must be a bit or bus of size {n}")

        for i, b in enumerate(self.input):
            b.build(self, input_names[i] if i < len(input_names) else None)
        for i, b in enumerate(self.output):
            b.build(self, output_names[i] if i < len(output_names) else None)

    def new_varname(self, varname=None):
        if varname is None:
            varname = 'var_' + str(len(self.varname_to_bits))
        suffix = ''
        if varname + suffix in self.varname_to_bits and not varname.startswith('var_'):
            suffix = '_' + str(len(self.varname_to_bits))
        while varname + suffix in self.varname_to_bits:
            suffix = '_' + \
                str(random.randint(0, 10 * len(self.varname_to_bits)))
        return varname + suffix

    # ---------- Conversion

    def to_netlist_repr(self):
        return {
            'input': [b.get_name(self) for b in self.input],
            'output': [b.get_name(self) for b in self.output],
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
        with open(file, 'w') as f:
            f.write(self.to_netlist())
