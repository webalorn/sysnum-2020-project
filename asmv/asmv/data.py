from .util import l_split, format_bits, AsmError


def data_of(datatype, val, risc_obj):
    args = l_split(val, on=',')

    if datatype == '.int':
        data = DataAssign(val, 32, 'int', risc_obj)
    elif datatype in ['.uint']:
        data = DataAssign(val, 32, 'uint', risc_obj)
    elif datatype in ['.word', '.4byte', '.long']:
        data = DataAssign(val, 32, 'bits', risc_obj)
    elif datatype in ['.byte']:
        data = DataAssign(val, 8, 'bits')
    elif datatype in ['.2byte', '.half', '.short']:
        data = DataAssign(val, 16, 'bits', risc_obj)
    elif datatype in ['.string', '.ident', '.asciz']:
        data = DataString(val)
    elif datatype == '.zero':
        data = ZeroData(val)
    else:
        raise AsmError(f'The datatype {datatype} doesn\'t exists')

    data.align(risc_obj.align)
    return data


class Data:
    pass


class DataAssign(Data):
    def __init__(self, val, size, datatype, risc_obj=None):
        self.val = val
        self.size = size
        self.mem_size = size
        self.datatype = datatype
        self.risc_obj = risc_obj

    def align(self, val):
        align_val = val * 8
        while self.mem_size % align_val:
            self.mem_size += 1

    def get_bits(self):
        return format_bits(self.val,
                           self.size,
                           self.datatype,
                           self.risc_obj,
                           abs_label=True)

    def compute(self):
        bits = self.get_bits()
        assert (len(bits) == self.size)
        return bits + '0' * (self.mem_size - len(bits))

    def __len__(self):
        return self.mem_size
        # return self.size


class DataString(DataAssign):
    def __init__(self, val, risc_obj=None):
        if len(val) < 2 or val[0] != '"' or val[-1] != '"':
            raise AsmError('A string must be surrounded by two " characters')
        val = eval(val)
        self.chars = [str(b) for b in bytes(val, 'utf-8')]
        self.chars.append('0')  # Add a NULL character
        super().__init__(None, len(self.chars) * 8, None, risc_obj)

    def get_bits(self):
        return ''.join([format_bits(c, 8, 'bits', None) for c in self.chars])


class ZeroData(DataAssign):
    def __init__(self, nbytes):
        try:
            nbytes = int(nbytes)
        except ValueError:
            raise AsmError(
                f'The value {nbytes} is not an integer and can\'t be used as the size of a .zero'
            )
        super().__init__(0, nbytes * 8, 'bits')
