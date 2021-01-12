from riscv import Proc


class MulProc(Proc):
    MUL_ENABLED = True
    DIV_ENABLED = True


if __name__ == "__main__":
    processor = MulProc()
    chip = processor.build()
    chip.compile_netlist('__build__/riscv_mul.net')
