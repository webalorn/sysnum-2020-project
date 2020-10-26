# ASMV

**TODO**

symbol parameter type ???

`la rd, <symbol>` -> pseudo instruction which is used to load symbol addresses

call <symbol>: call away subroutine[^1]
call <rd>, <symbol>: call away subroutine[^2]
tail <symbol>: tail call away subroutine[^3]
jump <symbol>, <rt>: jump to away routine[^4]
[^1]: ra is implicitly used to save the return address. [^2]: similar to call <symbol>, but <rd> is used to save the return address instead. [^3]: t1 is implicitly used as a scratch register. [^4]: similar to tail <symbol>, but <rt> is used as the scratch register instead.

+ other jump / branch pseudo intructions


## Command usage

## ASM description

Each line can start with a label. A label is a string followed by `:` like this: `labelname:`. The valid characters for a label are `[0-9a-zA-Z_]`. It will be converted to the memory address of the next instruction or data block location. If a label is not followed by an instruction, it will point to the next free memory byte, just after the program.

Comments start with `#` or `//` and end at the end of the line.

Their is 2 type of instructions

### Configuration instruction

A configuration instruction starts with a `.` followed, without space, by the name of the instruction. They are valid only for the instructions after them (if applicable).

```
#align n
#start labelname
```

- `.align`: `n` must be an integer. It align all each data block on `n` bytes. The default value is `1`. With `4`, a single char will take `32` bits, but a string of 4 chars still takes `32` bits. Must be `1`, `2` or `4`.
- `.start` set the starting label. Default is `main`

### Data block

A datablock takes the following form : `.typename value`. It is strongly advised to put the datablocks at the end of the program, because it could disturp the program flow if they are not 4-byte aligned, or the program doesn't explicitly jump over them. The alowed types are :

```
.int [32_bits_signed_int]
.uint [32_bits_signed_int]
.string "sequence_of_chars"
```


### Data formats

- **integers** (operand and data)
  - `42`, `-42` : decimal
  - `0b101010`, `-0b101010` : binary
  - `0x2a`, `-0x2a` : hexadecimal
  - `*label` : address of the memory pointer associated with `label`
  - `label` : relative address of the memory pointer associated with `label`
- **string** (data)
  - "this_is_a_string" : must be surrounded by `"`.
- **register**
  - `x0`, ..., `x31`

### Assembly instructions

An assembly instruction generates one (or for some pseudo instructions, multiple) instructions for the ISA.

#### Base integer instructions

TODO : list all from document AFTER

- Integer Register-Immediate Instructions
  - `ADDI rd rs1 int:12` : rd <- rs1 + int:12
  - `SLTI rd rs1 int:12` : rd <- 1 if rs1 < int:12 else 0
  - `SLTIU rd rs1 uint:12` : rd <- 1 if rs1 < **uint:12** else 0
  - `ANDI rd rs1 int:12`
  - `ORI rd rs1 int:12`
  - `XORI rd rs1 int:12`
  - Shifts
    - `SLLI rd rs1 int:4` : shift left
    - `SRLI rd rs1 int:4` : shift right
    - `SRAI rd rs1 int:4` : shift left but keep sign
  - Load (20 bits operand, fill the lowest 12 bits with 0)
    - `LUI rd int:20` : rd <- int . 000000000000
    - `AUIPC rd int:20` : rd <- pc + (int . 000000000000)

- Pseudo intructions
  - `NOT rd rs` : rd <- ~(rs)  => `XORI rs rs1 -1`
  - `MV rd rs` : rd <- rs  => `ADDI rd rs 0`
  - `LI rd uint:32` : rd <- uint
  - ...
