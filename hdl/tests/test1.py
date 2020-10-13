import hdl
from hdl import *
# from hdl.operations import *


def adder(b1, b2):
    # e = ConstBitArr(2, )
    a = RamOp(2, 4, '01', 1, '10', '0101')

    return [a]


chip = hdl.Chip(adder, [4, 2], input_names=['coucou', 'a1', 'a2'])
# chip.compile_netlist('test1.net')
r = chip.to_netlist()
print(r)
