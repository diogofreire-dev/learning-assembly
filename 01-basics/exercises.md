# 01 – Basics: exercises

One small step at a time. Do them in order, and do not move on until the previous one makes sense.

Run every exercise from the repository root with `make run/01-basics/<name>`.

## Part 1 – Change the examples

**1.** Run `00-exit`. Then change the `42` in `00-exit.s` to another number (between 0 and 255) and run it again. Does the exit code change to your number?

**2.** Try `300` in `00-exit.s`. What exit code do you get? Write down your guess for why before asking. (Hint: the exit code only has room for numbers from 0 to 255.)

**3.** Run `01-hello`. Change the message to your name and run it again.

## Part 2 – Write your own

For each one, create a new file in `01-basics/` (start by copying `00-exit.s`) and check the exit code.

**4.** `02-add.s` – put `5` in `w0`, then add `3` to it. Expected exit code: `8`.

**5.** `03-sub.s` – put `10` in `w0`, then subtract `4`. Expected exit code: `6`.

**6.** `04-two-boxes.s` – put `20` in `w0` and `22` in `w1`, then add `w1` to `w0`. Expected exit code: `42`.
(Hint: `add` can also add two registers: `add w0, w0, w1`.)

**7.** `05-mul.s` – compute `6 * 7`. Expected exit code: `42`.
(Hint: `mul` only works with registers, not with `#` numbers, so put both numbers in boxes first.)

## Part 3 – Look inside (optional)

**8.** Open one of your programs in lldb (in a real terminal, not through Claude):

```bash
make dbg/01-basics/02-add
```

Then type, one at a time: `b main`, `run`, `si`, `register read w0`, `si`, `register read w0`.
Watch the number in `w0` change after each instruction. Type `quit` to leave.
