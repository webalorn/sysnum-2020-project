import argparse
from pathlib import Path

from .riscasm import RiscAsm
from .util import AsmError
import asmv.operations


def get_cmd_args():
    parser = argparse.ArgumentParser(
        prog='asm2rv',
        description="Compile custom ASM to pseudo-RISC-V instructions",
    )

    parser.add_argument('-b', '--bin', help='Binary format (instead of text)',
                        action='store_true', default=False)
    parser.add_argument('--rom', help='Enable ROM mode (prefix label addresses)',
                        action='store_true', default=False)
    parser.add_argument('-o', '--output', type=str,
                        help='Output file', default='a.risc')
    parser.add_argument('-e', '--extern', type=str,
                        help='Write external metadata into a file', default=None)
    parser.add_argument('file', type=str, help='Path of the asm file')

    return parser.parse_args()


def main():
    args = get_cmd_args()

    with open(args.file, 'r') as infile:
        content = infile.read()

    try:
        asm = RiscAsm(content, args.rom)
    except AsmError as e:
        print(f"\033[91m[ASM ERROR] {str(e)}\033[0m")
        return - 1

    if asm.virtual_labels:
        print("[WARNING] Created virtual labels:",
              ', '.join(asm.virtual_labels))

    if args.bin:
        with open(args.output, 'wb') as outfile:
            outfile.write(asm.get_bin_repr())
    else:
        with open(args.output, 'w') as outfile:
            outfile.write(asm.get_text_repr())
    # TODO : extern


if __name__ == "__main__":
    main()
