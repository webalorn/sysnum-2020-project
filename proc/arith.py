import hdl
from hdl import reg, Bit, BitRegister, mux, concat, bit, RamOp
from hdl.blocks import MultiSourceReg, virtual, MultiControl


# def left_shift(bits, shift):
# 	shift = list(shift)
# 	k = 1
# 	while shift:
# 		bits = mux(shift.pop(), bits, bits << )
