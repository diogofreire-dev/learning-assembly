# 03 – Memory: exercises

Read `notes.md` first. Do them in order.

Run every exercise from the repository root with `make run/03-memory/<name>`.

## Part 1 – Change the examples

**1.** Run `00-load`. Then change the `.word 42` to another number and run it again. Notice that you changed the **data**, not the instructions.

**2.** In `01-array.s`, make the program return only the **last** number of the array. Expected exit code: `12`.
(Hint: you only need one `ldr`, with the right offset.)

**3.** In `01-array.s`, add a fourth number, `8`, to the array, and add it to the sum too. Expected exit code: `50`.

## Part 2 – Write your own

For each one, create a new file in `03-memory/` (start by copying one of the examples) and check the exit code.

**4.** `02-store.s` – put a variable in memory with `.word 0`. Write `99` into it with `str`, then read it back with `ldr` into `w0`. Expected exit code: `99`.

**5.** `03-array-loop.s` – add the five numbers of `.word 1, 2, 3, 4, 5` **with a loop** (topic 02). Expected exit code: `15`.
(Hint: after each `ldr`, move the address to the next int with `add x1, x1, #4`, and keep a counter of how many are left.)

**6.** `04-array-max.s` – find the biggest number in `.word 4, 17, 9, 2, 11`. Expected exit code: `17`.
(Hint: mix exercise 5 with `02-max.s` from topic 02.)

**7.** `05-strlen.s` – count the letters of `.asciz "Hello"`. Expected exit code: `5`.
(Hint: read one byte at a time with `ldrb` and stop when you read a `0`, the end of the string — just like `strlen` in C.)

## Part 3 – Look inside (optional)

**8.** Open the array in lldb (in a real terminal, not through Claude):

```bash
make dbg/03-memory/01-array
```

Type `b main`, `run`, `si`, `si` (now `x1` holds the address of the array), and then:

```
register read x1
memory read --size 4 --format d --count 3 $x1
```

You should see the address, and then the three numbers `10 20 12` sitting at that address. Type `quit` to leave.
