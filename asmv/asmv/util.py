import re

OFFSET_REG = re.compile(r"(\S+)\((\S+)\)")


class AsmError(Exception):
    def __init__(self, message, line=None):
        self.message = message
        self.line = line

        if line is not None:
            message += f" (on line {line+1})"
        super().__init__(message)


# Split line, trim, and ensure output size
def l_split(line, nb=0):
    parts = line.strip().split(maxsplit=nb - 1)
    parts = [p.strip() for p in parts]
    # Remove "," because they are not used
    parts = [p[:-1] if p.endswith(',') else p for p in parts if p != ',']
    while len(parts) < nb:
        parts.append('')
    return parts


def offsets_to_args(line):
    """ Convert n(reg) to reg n """
    while True:
        m = OFFSET_REG.search(line)
        if m:
            a, b = m.span(0)
            line = line[:a] + m.group(2) + ' ' + m.group(1) + line[b:]
        else:
            return line


def bin_of_size(s, size):
    s = '0' * (size - len(s)) + s
    return s[-size:]


def bin_add(s1, s2, size=32):  # For positives only
    s1, s2 = int(s1, 2), int(s2, 2)
    r = bin(s1 + s2)[2:]
    return bin_of_size(r, size)
