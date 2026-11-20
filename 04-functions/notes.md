# 04 – Functions

A function is just a label you jump to — with a way to **come back**.

## Calling and returning

| Instruction | What it does |
|---|---|
| `bl name` | jump to `name` **and** write down where to come back in `x30` |
| `ret` | jump to the address written in `x30` |

`bl` means "branch with link": `x30` is the **link register**, the "come back here" note.

## Passing values (the calling convention)

Everyone agrees on the same boxes, so any function can call any other:

- Arguments go in `w0`, `w1`, `w2`, … (in order).
- The result comes back in `w0`.

```c
int add3(int a, int b, int c) { return a + b + c; }
add3(10, 20, 12);
```

```asm
    mov w0, #10         // a
    mov w1, #20         // b
    mov w2, #12         // c
    bl  add3            // after this, w0 = 42
```

## The problem: there is only one `x30`

`main` was also called by someone, so its own "come back here" note is in `x30`.
When `main` does `bl`, that note is **overwritten** — and `main`'s `ret` would no longer know where to go.

The fix: a function that calls another function **saves `x30` on the stack** first, and takes it back before `ret`.

## The stack

A piece of memory for saving things for a while. `sp` (stack pointer) holds the address of its top.
For now, two lines, always the same (just copy them, like `adrp`):

```asm
_main:
    stp x29, x30, [sp, #-16]!   // save x29 and x30 on the stack (at the start)
    ...                         // now it is safe to use bl
    ldp x29, x30, [sp], #16     // take them back (just before ret)
    ret
```

A function that does **not** call anyone (like `add3`) does not need these lines.

## Why this matters for security

The saved `x30` sits **in memory**, on the stack, next to the function's local variables.
If a program writes past the end of a local array (a buffer overflow), it can overwrite that saved `x30` — and then `ret` jumps wherever the attacker wants.

## In my own words

-
