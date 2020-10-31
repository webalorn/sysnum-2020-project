import re

HI_MOD = 2 ** 12
OFFSET_REG = re.compile(r"(\S+)\((\S+)\)")


class AsmError(Exception):
    def __init__(self, message, line=None):
        self.message = message
        self.line = line

        if line is not None:
            message = f"Line {line+1}: " + message
        super().__init__(message)


# Split line, trim, and ensure output size
def l_split(line, nb=1, on=r'\n|\ |\t'):
    # parts = line.strip().split(on, maxsplit=nb - 1)
    parts = re.split(on, line.strip(), maxsplit=nb - 1)
    parts = [p.strip() for p in parts]
    # Remove "," because they are not used
    # parts = [p[:-1] if p.endswith(',') else p for p in parts if p != ',']
    while len(parts) < nb:
        parts.append('')
    return parts


def bin_of_size(s, size):
    s = '0' * (size - len(s)) + s
    return s[-size:]


def bin_add(s1, s2, size=32):  # For positives only
    s1, s2 = int(s1, 2), int(s2, 2)
    r = bin(s1 + s2)[2:]
    return bin_of_size(r, size)


def is_integer(n):
    try:
        n = int(n)
        return True
    except:
        return False


def first_lower(l, val):
    for v in l[::-1]:
        if v <= val:
            return v
    return None


def first_upper(l, val):
    for v in l:
        if v > val:
            return v
    return None


def hi_lo(imm):
    assert len(imm) == 32
    imm1, imm2 = imm[:20], imm[20:]
    if imm2[0] == '1':
        imm1 = bin_add(imm1, '1', 20)
    return imm1, imm2


def hi_lo_int(val):
    hi, lo = val // HI_MOD, val % HI_MOD
    if lo & (HI_MOD >> 1):
        hi_mod = 2**20
        # hi = (hi + hi_mod - 1) % hi_mod
        hi = (hi + 1) % hi_mod
        lo -= 2**12
    return hi, lo

# ========== ASM convertion ==========


def offsets_to_args(line):
    """ Convert n(reg) to reg n """
    while True:
        m = OFFSET_REG.search(line)
        if m:
            a, b = m.span(0)
            line = line[:a] + m.group(2) + ' ' + m.group(1) + line[b:]
        else:
            return line


def r_match(r, line):
    return re.match(r, line, re.IGNORECASE)


def simplify_asm(line):
    line = line.strip()
    # SW, ..., with offset
    m = r_match(r'^((?:sw|sh|sb)u?)\s+(\w+),\s+(\S+)\((\w+)\)$', line)
    if m:
        return f'{m.group(1)} {m.group(4)}, {m.group(2)}, {m.group(3)}'
    # LW, ...., with offset
    m = r_match(r'^((?:lw|lh|lb)u?)\s+(\w+),\s+(\S+)\((\w+)\)$', line)
    if m:
        return f'{m.group(1)} {m.group(2)}, {m.group(4)}, {m.group(3)}'
    # call <symbol> -> call ra, <symbol>
    m = r_match(r'^(call)\s+([^\s,]+)$', line)
    if m:
        return f'{m.group(1)} ra, {m.group(2)}'
    # jalr rs
    m = r_match(r'^jalr\s+([a-z0-9]+)$', line)
    if m:
        return f'jalr ra, {m.group(1)}, 0'

    return line

# ========== FORMAT ==========


def int_of_val(arg, risc_obj=None, rel_label=False, abs_label=False):
    var_args = [risc_obj, rel_label, abs_label]
    if isinstance(arg, int):
        return arg

    if risc_obj is not None and not is_integer(arg):
        if arg.startswith('%hi'):  # %hi(...)
            val = int_of_val(arg[4:-1], risc_obj, False, True)
            return hi_lo_int(val)[0]
        elif arg.startswith('%lo'):  # %lo(...)
            val = int_of_val(arg[4:-1], risc_obj, False, True)
            return hi_lo_int(val)[1]
        elif arg.startswith('*'):  # Address of label
            return risc_obj.get_label(arg[1:])

    if '+' in arg:
        return sum([int_of_val(v.strip(), *var_args) for v in arg.split('+')])

    if risc_obj is not None and not is_integer(arg):
        if rel_label and arg in risc_obj.labels:
            return risc_obj.get_label(arg) - risc_obj.cur_asm_pt
        elif abs_label and arg in risc_obj.labels:
            return risc_obj.get_label(arg)
        elif arg in risc_obj.consts:
            return risc_obj.consts[arg]
        elif not arg.lower().startswith('0b') and not arg.lower().startswith('0x'):
            # Create a label to a value of 0
            # if rel_label:  # Disabled
            #     return risc_obj.get_label(arg, True) - risc_obj.cur_asm_pt
            if abs_label:
                return risc_obj.get_label(arg, True)

    base = 10
    arg = arg.lower()
    if arg.startswith('0b'):
        base = 2
    if arg.startswith('0x'):
        base = 16
    try:
        return int(arg, base)
    except ValueError:
        raise AsmError(f"The value {arg} doesn't represent an integer")


def format_bits(arg, size, arg_type, risc_obj=None, rel_label=False, abs_label=False):
    arg_val = int_of_val(arg, risc_obj, rel_label, abs_label)

    # Check size
    inf, sup = 0, 2 ** size
    if arg_type == 'int':
        inf, sup = -2 ** (size - 1), 2 ** (size - 1)
    elif arg_type == 'bits':
        inf = -2 ** (size - 1)  # Allow int / uint range
    if not inf <= arg_val < sup:
        raise AsmError(
            f"The value {arg_val} ({arg}) must be between {inf} and {sup-1} (rvalue of size {size})")

    neg = bool(arg_val < 0)
    if neg:
        arg_val = -arg_val - 1
    bits = bin(arg_val)[2:]
    bits = (size - len(bits)) * '0' + bits
    if neg:
        bits = ''.join(['1' if b == '0' else '0' for b in bits])
    return bits
