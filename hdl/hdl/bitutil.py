from .wires import Bit
from .annotation import hdl_function

# ========== Bit manipulation functions ==========


@hdl_function
def extend(size: int, bus: 'bus', paddwith='0'):
    if len(bus) < size:
        bus = paddwith * (size - len(bus)) + bus
    return bus


@hdl_function
def sign_extend(size: int, bus: 'bus'):
    if len(bus) < size:
        bus = bus[0] * (size - len(bus)) + bus
    return bus
