import hdl
from hdl import reg, Bit, mux, concat, bit
from hdl.blocks import MultiSourceReg


class RiscDecoder:
    def __init__(self, opcode):
        self.codes = {
            '': bit(1),
        }
        for b in opcode:
            next_codes = {}
            for code, control in self.codes.items():
                next_codes[code + '0'] = control & (~b)
                next_codes[code + '1'] = control & b
            self.codes = next_codes

    def get_control(self, code):
        return self.codes[code]


class SimpleDecoder(RiscDecoder):
    def __init__(self, addr):
        super().__init__(addr)

        for code, val in list(self.codes.items()):
            self.codes[int(code, 2)] = val
