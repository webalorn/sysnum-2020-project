import re

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
    # SW, ..., with offset
    m = r_match(r'((?:sw|sh|sb)u?)\s+(\w+),\s+(\S+)\((\w+)\)', line)
    if m:
        return f'{m.group(1)} {m.group(4)}, {m.group(2)}, {m.group(3)}'
    # LW, ...., with offset
    m = r_match(r'((?:lw|lh|lb)u?)\s+(\w+),\s+(\S+)\((\w+)\)', line)
    if m:
        return f'{m.group(1)} {m.group(2)}, {m.group(4)}, {m.group(3)}'
    # call <symbol> -> call ra, <symbol>
    m = r_match(r'(call)\s+([^\s,]+)\s*', line)
    if m:
        return f'{m.group(1)} ra, {m.group(2)}'

    return line
