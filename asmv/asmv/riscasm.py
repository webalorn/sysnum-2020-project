from .util import AsmError, l_split, offsets_to_args, simplify_asm
from .util import is_integer, first_upper, first_lower, int_of_val, format_bits
from .data import data_of, Data

import functools
import re

# Sizes are in bytes
OP_SIZE = 4

all_operations = {}  # 'name' -> (size, fct)

VALID_LABELS = re.compile(r"^[a-zA-Z0-9_\.]+$")
IGNORED_CONFIGS = ['.file', '.globl', '.local', '.addrsig', '.type',
                   '.section', '.text', '.data', '.rodata', '.bss', '.size',
                   '.addrsig', '.addrsig_sym', '.cfi_startproc', '.cfi_endproc',
                   '.cfi_def_cfa_offset', '.cfi_offset', '.cfi_def_cfa', '.weak']

# TODO : maybe cfi, etc.... may have a meaning ?

ALL_REGS = {'x' + str(k): k for k in range(32)}

ALL_REGS['zero'] = ALL_REGS['x0']
ALL_REGS['ra'] = ALL_REGS['x1']
ALL_REGS['sp'] = ALL_REGS['x2']
ALL_REGS['gp'] = ALL_REGS['x3']
ALL_REGS['tp'] = ALL_REGS['x4']
ALL_REGS['t0'] = ALL_REGS['x5']
ALL_REGS['t1'] = ALL_REGS['x6']
ALL_REGS['t2'] = ALL_REGS['x7']
ALL_REGS['s0'] = ALL_REGS['x8']
ALL_REGS['fp'] = ALL_REGS['x8']
ALL_REGS['s1'] = ALL_REGS['x9']
ALL_REGS['a0'] = ALL_REGS['x10']
ALL_REGS['a1'] = ALL_REGS['x11']
ALL_REGS['a2'] = ALL_REGS['x12']
ALL_REGS['a3'] = ALL_REGS['x13']
ALL_REGS['a4'] = ALL_REGS['x14']
ALL_REGS['a5'] = ALL_REGS['x15']
ALL_REGS['a6'] = ALL_REGS['x16']
ALL_REGS['a7'] = ALL_REGS['x17']
ALL_REGS['s2'] = ALL_REGS['x18']
ALL_REGS['s3'] = ALL_REGS['x19']
ALL_REGS['s4'] = ALL_REGS['x20']
ALL_REGS['s5'] = ALL_REGS['x21']
ALL_REGS['s6'] = ALL_REGS['x22']
ALL_REGS['s7'] = ALL_REGS['x23']
ALL_REGS['s8'] = ALL_REGS['x24']
ALL_REGS['s9'] = ALL_REGS['x25']
ALL_REGS['s10'] = ALL_REGS['x26']
ALL_REGS['s11'] = ALL_REGS['x27']
ALL_REGS['t3'] = ALL_REGS['x28']
ALL_REGS['t4'] = ALL_REGS['x29']
ALL_REGS['t5'] = ALL_REGS['x30']
ALL_REGS['t6'] = ALL_REGS['x31']

ASM_HEADER = """
    mv s1, ra # Save return address
    call __asm_init
    mv ra, s1
    j main # Set 'main' as the starting label
"""
ASM_HEADER_ROM = """
exit:
__asm_init:
    addi a0, zero, 4
    j _Znwj # Allocate memory for the mem pt
_Znwj:
_Znaj: # a0 = size
	mv t0, a0 # t0 = size
	lw a0, 0(zero) # a0 = addr of block begin
	add t0, a0, t0 # to = addr of next block=
	sw t0, 0(zero) # Store the next addr
	ret
"""
ASM_HEADER_RAM = """
__asm_init:
    lui t0, %hi(__asmv_exit_addr)
    sw s1,  %lo(__asmv_exit_addr)(t0)

    lui t0, %hi(__asmv_end_of_file)
    addi t0, t0, %lo(__asmv_end_of_file)
    lui t1, %hi(__asm__freept)
    sw t0,  %lo(__asm__freept)(t1)

    ret
exit:
    lui t0, %hi(__asmv_exit_addr)
    lw ra, %lo(__asmv_exit_addr)(t0)
    ret
# _Znwj:
# _Znaj: # a0 = size
# 	lui t0, %hi(__asmv_alloc_stack_top) # t0 = hi de __asmv_alloc_stack_top
# 	mv t1, a0 # t1 = size
# 	lw a0, %lo(__asmv_alloc_stack_top)(t0) # a0 = alloc_pos
# 	add t1, a0, t1 # t1 = size + alloc_pos
# 	sw t1, %lo(__asmv_alloc_stack_top)(t0) # t1 -> alloc_pos
# 	ret
"""

ASM_FOOTER_RAM = """
__asmv_exit_addr:
    .word 0
__asmv_alloc_stack_top:
	.word __asmv_end_of_file
__asmv_end_of_file:
"""

ASM_FOOTER_ROM = """
"""


class RiscAsm:
    def __init__(self, content, rom_mode=False):
        self.cur_size = 0
        self.labels = {}
        self.consts = {}
        self.align = 4
        self.base_address = 0
        self.virtual_labels = []

        asm_header = ASM_HEADER_ROM if rom_mode else ASM_HEADER_RAM
        asm_header = ASM_HEADER + asm_header
        self.init_ops = [line for line in asm_header.split('\n') if line]
        asm_footer = ASM_FOOTER_ROM if rom_mode else ASM_FOOTER_RAM
        self.end_ops = [line for line in asm_footer.split('\n') if line]

        if rom_mode:
            # We need to set the starting value for the stack pointer
            self.init_ops = [
                'li sp, 0b00011111111111111111111111111111'] + self.init_ops
            self.base_address += 1 << 29

        self.cur_asm_pt = self.base_address
        self.load(content)

    def get_label(self, label, create_label=False):
        rel_int = ((label.endswith('b') or label.endswith('f'))
                   and is_integer(label[:-1]))
        label_id = label[:-1] if rel_int else label

        if label_id not in self.labels:
            if create_label:  # Virtual have a size of 32
                if not VALID_LABELS.match(label):
                    raise AsmError(
                        f"The label name '{label}' contains invalid characters")
                self.labels[label] = self.cur_size + self.base_address
                self.virtual_labels.append(label)
                self.cur_size += 32
                return self.labels[label]
            raise AsmError(f"The label {label} is not a valid label")
        label_val = self.labels[label_id]
        if rel_int:
            if label.endswith('b'):
                label_val = first_lower(label_val, self.cur_asm_pt)
                if label_val is None:
                    raise AsmError(f"No backward reference to {label_id}")
            else:
                label_val = first_upper(label_val, self.cur_asm_pt)
                if label_val is None:
                    raise AsmError(f"No forward reference to {label_id}")
        return label_val

    def load(self, content):
        all_lines = content.split("\n")
        all_lines = self.init_ops + all_lines + self.end_ops

        # Compute config, create fct and data objects
        for i_line, line in enumerate(all_lines):
            try:
                all_lines[i_line] = self.preprocess_line(line)
            except AsmError as e:
                raise AsmError(e.message, i_line - len(self.init_ops))

        if 'main' not in self.labels:
            raise AsmError('The "main" label is not defined')

        # Create data objets
        for i_line, line in enumerate(all_lines):
            try:
                if isinstance(all_lines[i_line], Data):
                    all_lines[i_line] = all_lines[i_line].compute()
            except AsmError as e:
                raise AsmError(e.message, i_line - len(self.init_ops))

        # Create asm instructions
        for i_line, line in enumerate(all_lines):
            try:
                all_lines[i_line] = self.post_process(line)
            except AsmError as e:
                raise AsmError(e.message, i_line - len(self.init_ops))

        for _ in self.virtual_labels:
            all_lines.append('0' * 32)
        self.bindata = '\n'.join([l for l in all_lines if l])

    def preprocess_line(self, line):
        line = self.remove_comments(line)
        line = line.strip()

        # Fetch labels
        while l_split(line, 2)[0].endswith(':'):
            label, line = l_split(line, 2)
            label = label[:-1]
            if is_integer(label):
                self.labels[label] = self.labels.get(label, [])
                self.labels[label + 'b'] = None  # Mark ?b, ?f as existing
                self.labels[label + 'f'] = None
                self.labels[label].append(self.cur_size + self.base_address)
            else:
                if label in self.labels:
                    raise AsmError(f"The label {label} is already defined")
                if not VALID_LABELS.match(label):
                    raise AsmError(
                        f"The label name '{label}' contains invalid characters")

                self.labels[label] = self.cur_size + self.base_address

        if line.startswith('.'):
            data = self.process_config(line)
            self.cur_size += len(data) // 8
            return data
        if line:
            return self.preprocess_asm(line)

        return line

    def post_process(self, line):
        if isinstance(line, tuple):
            fct, args, nb_ops = line
            self.cur_asm_pt += (nb_ops - 1) * 4  # Set the pt for the last op

            line_parts = []
            parts = fct(self, *args)
            if not isinstance(parts, tuple):
                parts = (parts,)
            self.cur_asm_pt += 4  # Move the pt after the last op

            for subpart in parts:
                subline = ''.join(subpart[::-1])
                assert len(subline) == 32
                line_parts.append(subline)
            return '\n'.join(line_parts)
        else:
            self.cur_asm_pt += len(line) // 8
        return line

    def remove_comments(self, line):
        """
            Remove everything after a #, except in strings
        """
        in_string = False
        for i, c in enumerate(line):
            next_c = line[i + 1] if i < len(line) - 1 else None
            if c == '"':
                in_string = not in_string
            if not in_string and (c == '#' or (c == '/' == next_c)):
                return line[:i]
        return line

    # ---------- Process instructions

    def process_config(self, line):
        name, val = l_split(line, 2)
        args = l_split(val, on=',')

        if name in ['.align', '.p2align']:
            if not val in ['1', '2', '4']:
                raise AsmError('Align parameter must be 1, 2, or 4')
            self.align = int(val)
        elif name == '.equ':
            arg, value = l_split(val, 2)
            self.consts[arg] = int_of_val(value)
        elif name not in IGNORED_CONFIGS:
            return self.process_data(line)
        return ''

    def process_data(self, line):
        datatype, val = l_split(line, 2)
        return data_of(datatype, val, self)

    def preprocess_asm(self, line):
        # line = offsets_to_args(line)
        line = simplify_asm(line)

        name, args = l_split(line, 2)
        args = l_split(args, on=',') if args else []
        name = name.upper()

        if not name in all_operations:
            raise AsmError(f"The operation {name} doesn't exists")
        size, fct = all_operations[name]
        self.cur_size += size * 4

        return (fct, args, size)

    # ---------- Output

    def get_text_repr(self):
        return self.bindata

    def get_bin_repr(self):
        text = self.get_text_repr()
        text = text.replace('\n', '')
        return bytearray([int(text[i: i + 8], 2)
                          for i in range(0, len(text), 8)])

# ========== All operations ==========


def multiop(name, nb_ops, *arg_types):
    """
        Arg types: 'reg', 'int:n', 'uint:n'
        (n=max size)
    """
    arg_types = list(arg_types)
    for i, typ in enumerate(arg_types):
        typ = typ.split(':')
        assert len(typ) in [1, 2]
        assert typ[0] in ['reg', 'int', 'uint', 'bits']
        if len(typ) >= 2:
            typ[1] = int(typ[1])
        arg_types[i] = typ

        if typ[0] == 'reg':
            assert len(typ) == 1
            typ.append(5)

    def wrapper(fct):
        @functools.wraps(fct)
        def wrapped_fct(risc_obj, *args):
            args = list(args)
            if len(args) != len(arg_types):
                raise AsmError(f"Wrong number of args for {fct}")

            for i, (typ, arg) in enumerate(zip(arg_types, args)):
                arg_type = 'bits'
                if typ[0] == 'reg':
                    if arg not in ALL_REGS:
                        raise AsmError(f"{arg} is not a valid register name")
                    arg = str(ALL_REGS[arg])
                else:
                    arg_type = typ[0]

                size = typ[1]
                arg = format_bits(arg, size, arg_type, risc_obj,
                                  rel_label=True)
                args[i] = arg

            ops = fct(*args)
            if nb_ops > 1:
                assert isinstance(ops, tuple)
                assert len(ops) == nb_ops
            return ops

        assert name not in all_operations
        all_operations[name] = (nb_ops, wrapped_fct)
        return fct  # The base function is kept intact
    return wrapper


def newop(name, *arg_types):
    return multiop(name, 1, *arg_types)
