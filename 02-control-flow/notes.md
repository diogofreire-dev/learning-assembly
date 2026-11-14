# 02 – Control flow

In topic 01 the CPU ran every instruction, top to bottom. Now it learns to **skip** lines and to **go back** — that is all an `if` and a loop are.

## Labels

A label is a name for a line, ending in `:`. It is not an instruction, just a bookmark you can jump to.

```asm
_main:          // a label you already know
loop:           // a label you choose
```

## Compare, then jump

It always takes two steps:

1. `cmp w0, #5` — compare `w0` with 5. The CPU **remembers** the result (bigger, smaller or equal) in special flags.
2. A jump that looks at that result:

| Instruction | Jumps if… | Like in C |
|---|---|---|
| `b label` | always | `goto label;` |
| `b.eq label` | equal | `==` |
| `b.ne label` | not equal | `!=` |
| `b.lt label` | less than | `<` |
| `b.le label` | less than or equal | `<=` |
| `b.gt label` | greater than | `>` |
| `b.ge label` | greater than or equal | `>=` |

If the condition is false, the CPU does **not** jump: it just goes on to the next line.

## An `if` is a jump forward

```c
if (w1 == 5) return 1;
return 0;
```

```asm
    cmp w1, #5
    b.eq equal      // equal? skip the next two lines
    mov w0, #0
    ret
equal:
    mov w0, #1
    ret
```

## A loop is a jump backward

```c
int w0 = 0;
do { w0 = w0 + 1; } while (w0 < 10);
```

```asm
    mov w0, #0
loop:
    add w0, w0, #1
    cmp w0, #10
    b.lt loop       // still less than 10? go back up
```

## In my own words

-
