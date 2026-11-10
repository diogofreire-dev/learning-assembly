# 01 – Basics

Read `00-how-it-works/notes.md` first.

## The first instructions

| Instruction | What it does | Like in C |
|---|---|---|
| `mov w0, #42` | put 42 in the box `w0` | `w0 = 42;` |
| `add w0, w0, #3` | `w0` plus 3, result in `w0` | `w0 = w0 + 3;` |
| `sub w0, w0, #3` | `w0` minus 3, result in `w0` | `w0 = w0 - 3;` |
| `ret` | finish the function, go back to whoever called it | `return` |

- The `#` means "this is a number", not a register.
- The first box after the instruction name is where the result goes.

## Registers: `x0` and `w0`

- `x0`, `x1`, `x2`, … are the boxes (registers). Each holds 64 bits.
- `w0` is the same box as `x0`, but only its lower half (32 bits), like an `int` in C.
- When a function ends, its return value must be in `x0` / `w0`.

## The exit code

When `main` ends, the value in `w0` becomes the program's **exit code**. It is the easiest way to see a result without `printf`:

```bash
make run/01-basics/00-exit     # → [exit code: 42]
```

## In my own words

-
