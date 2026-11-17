# 03 – Memory

Registers are few. Everything else — variables, arrays, strings — lives in **memory**.

## Memory is a long row of numbered bytes

```
address:  1000  1001  1002  1003  1004  1005  ...
value:     42     0     0     0    20     0   ...
```

- Each byte has a number: its **address**.
- An `int` (a **word**) takes 4 bytes, so the next `int` in an array is **4 addresses later**.
- Addresses are big numbers, so they always go in the 64-bit boxes: `x1`, `x2`, … (not `w1`).

## Putting data in memory

```asm
.data                   // from here on: data, not instructions
.p2align 2              // line up on a multiple of 4
number:  .word 42               // one int
array:   .word 10, 20, 12       // three ints, one after the other
text:    .asciz "Hello"         // a string, with a 0 byte at the end (like in C)
```

## Getting the address of a label

Always the same two lines. For now, just copy them:

```asm
    adrp x1, number@PAGE
    add  x1, x1, number@PAGEOFF     // now x1 = the address of number
```

(Like `int *x1 = &number;` in C.)

## Reading and writing

| Instruction | What it does | Like in C |
|---|---|---|
| `ldr w0, [x1]` | **load**: read the int at address `x1` into `w0` | `w0 = *x1;` |
| `str w0, [x1]` | **store**: write `w0` to the int at address `x1` | `*x1 = w0;` |
| `ldr w0, [x1, #4]` | read the int 4 bytes after `x1` | `w0 = x1[1];` |
| `ldrb w0, [x1]` | read just **one byte** (a `char`) | `w0 = *(char *)x1;` |

The `[ ]` means "the memory at this address", like `*` in C.

## In my own words

-
