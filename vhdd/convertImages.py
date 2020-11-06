from PIL import Image
from pathlib import Path
import sys
import os


def int2word(n):
    parts = []
    for i in range(4):
        parts.append((n // (256**(3 - i))) % 256)
    return bytes(parts)


def convert(img):
    ncols, nrows = img.size
    data = list(img.getdata())
    assert len(data[0]) == 4
    return [data[i * ncols:(i + 1) * ncols] for i in range(nrows)]


def make_conversion(img_path, dest_path, show=False, background=0):
    img = convert(Image.open(img_path))
    with open(dest_path, 'wb') as f:
        f.write(int2word(len(img)))
        f.write(int2word(len(img[0])))
        for line in img:
            for (r, g, b, alpha) in line:
                if alpha == 0:
                    r, g, b = 1, 1, 1
                f.write(int2word(r + 256 * (g + 256 * (b + 256 * alpha))))


def get_all_images_paths(path):
    files = list(path.iterdir())
    imgs = [p for p in files if p.is_file() and p.suffix in [".png", ".jpg"]]
    for d in files:
        if d.is_dir():
            imgs.extend(get_all_images_paths(d))
    return imgs


def main():
    source_path = Path("images")
    dest_path = Path("files/images")

    imgs = get_all_images_paths(source_path)
    imgs = [p.relative_to(source_path) for p in imgs]

    for p in imgs:
        (dest_path / p).parent.mkdir(parents=True, exist_ok=True)
        print("Converting:", p)
        make_conversion(str(source_path / p),
                        str((dest_path / p).with_suffix(".sbi")))


if __name__ == '__main__':
    main()
