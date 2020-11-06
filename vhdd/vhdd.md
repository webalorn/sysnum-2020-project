# Virtual Hard drive file

## Script usage

```python
python3 vhdd.py new drive.vhdd ../code/build/main.s files
```

## File description

Each sector of a `.vhdd` starts with two informations : 
- type of the sector (32 bits unsigned integer)
- Size of the sector (32 bits unsigned integer)

Everything is 32-bits aligned

### Boot sector

It must be the first sector on the VHDD. Id: `0`. The size is the size of the program, which will be fully loaded into memory.


### File sector

It must be the second sector on the VHDD. Id: `1`.


#### Directory

- Type : `1` (32 bits)
- Number of files / directories (32 bits)
- For each file / directory :
  - Address of the file on the VHDD
  - Size of the name (`n`, on 32 bits)
  - `n` words of 32 bits (unicode characters)

#### File

- Type : `0` (32 bits)
- Size of the file (`n`, on 32 bits). `n` is the number of bytes, but must be a multiple of 4 (because 32-bits aligned).
- Binary content (`n` bytes)


## File formats

### Simple bitmap image (.sbi)

- height
- width
- for each pixel (line by line), 4 bytes : `<red>` `<blue>` `<green>` `<alpha>`
