import hdl
from riscv import Proc


class ClockProc(Proc):
    INPUTS = [
        ("tic", 1),
        ("cur_time", 32),
    ]
    OUTPUTS = [
        ("input_signal", 7),  # Can't be written on
        ("poweroff", 1),  # Index 0
        ("console", 32),
    ]
    RAM_ADDR_SIZE = 10
    ROM_ADDR_SIZE = 20

    MUL_ENABLED = False
    DIV_ENABLED = False


if __name__ == "__main__":
    processor = ClockProc()
    chip = processor.build()
    chip.compile_netlist('__build__/riscv_clock.net')
