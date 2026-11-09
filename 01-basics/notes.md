# 01 – Basics

## Registers (ARM64)

- `x0`–`x30`: 31 general-purpose registers, 64 bits each. `w0`–`w30` are the low 32 bits of the same registers.
- `x0`–`x7`: function arguments; `x0` is also the return value.
- `x30` (`lr`): link register — the return address. `ret` jumps to it.
- `sp`: stack pointer. `pc`: program counter (not directly writable).

## System calls (macOS)

- Number in `x16`, arguments in `x0`…, then `svc #0x80`.
- `write` = 4, `exit` = 1.

## Things I learned

-
