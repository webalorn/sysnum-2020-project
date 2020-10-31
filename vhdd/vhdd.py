import sys
from pathlib import Path


class UsageError(Exception):
    pass


# def write_word(file, word):
#     assert len(word) == 32
#     word = [bool(word in [1, '1']) for b in word[:32]]
#     file.write(''.join('1' if b else '0' for b in word))

def int2word(n):
    parts = []
    for i in range(4):
        parts.append((n // (256 ** (3 - i))) % 256)
    return bytes(parts)


def align32(barray):
    if len(barray) % 4:
        barray = barray + bytes(4 - len(barray) % 4)
    return barray


class File:
    def __init__(self, path):
        with open(str(path), 'rb') as f:
            self.content = align32(f.read())
        self.size = len(self.content)
        self.disk_size = self.size + 8

    def write_on(self, hdd_file, cur_addr):
        hdd_file.write(int2word(0))
        hdd_file.write(int2word(self.size))
        hdd_file.write(self.content)


class Directory:
    def __init__(self, path):
        self.children = {}
        self.disk_size = 8
        for sub in path.iterdir():
            if sub.is_file():
                self.children[sub.name] = File(sub)
            elif sub.is_dir():
                self.children[sub.name] = Directory(sub)

        self.folder_header_size = self.disk_size
        for name, sub in self.children.items():
            self.disk_size += 8 + len(name) * 4 + sub.disk_size
            self.folder_header_size += 8 + len(name) * 4

    def write_on(self, hdd_file, cur_addr):
        hdd_file.write(int2word(1))
        hdd_file.write(int2word(len(self.children)))
        cur_addr += self.folder_header_size
        mem_pt = cur_addr

        for name, sub in self.children.items():
            hdd_file.write(int2word(mem_pt))
            hdd_file.write(int2word(len(name)))
            for c in name:
                hdd_file.write(int2word(ord(c)))

            mem_pt += sub.disk_size

        for _, sub in self.children.items():
            sub.write_on(hdd_file, cur_addr)
            cur_addr += sub.disk_size


class FakeDirectory():
    def __init__(self):
        self.disk_size = 0

    def write_on(self, *args):
        pass


def cmd_new(dest_path, codefile_path, root_path):
    if codefile_path == '-':
        code = bytes(0)
    else:
        with open(codefile_path) as codefile:
            code = ''.join([c for c in codefile.read() if c in '01'])
        code = bytes([int(code[i:i + 8], 2) for i in range(0, len(code), 8)])
        code = align32(code)

    if root_path == '-':
        files = FakeDirectory()
    else:
        files = Directory(Path(root_path))

    with open(dest_path, 'wb') as hdd_file:
        # Write the binary file
        hdd_file.write(int2word(0))
        hdd_file.write(int2word(len(code)))
        hdd_file.write(code)

        # Write the files
        hdd_file.write(int2word(1))
        hdd_file.write(int2word(files.disk_size))
        files.write_on(hdd_file, 16 + len(code))


def main():
    if sys.argv[1] == 'new':
        cmd_new(sys.argv[2], sys.argv[3], sys.argv[4])
    else:
        raise UsageError(f'The command {sys.argv[1]} doens\'t exists')


if __name__ == "__main__":
    try:
        main()
    except UsageError as e:
        print(f"\033[91m[USAGE ERROR] {str(e)}\033[0m")
