# 02 – Control flow: exercises

Read `notes.md` first. Do them in order.

Run every exercise from the repository root with `make run/02-control-flow/<name>`.

## Part 1 – Change the examples

**1.** Run `00-if`. Then change the first line to `mov w1, #7` and run it again. Why does the exit code change?

**2.** In `00-if.s`, change `b.eq` to `b.ne`. What do you get now with `w1 = 5`? And with `w1 = 7`?

**3.** Run `01-loop`. Change the `10` in the `cmp` to `25`. Does the loop now count to 25?

## Part 2 – Write your own

For each one, create a new file in `02-control-flow/` (start by copying one of the examples) and check the exit code.

**4.** `02-max.s` – put `7` in `w1` and `12` in `w2`, and return the bigger one. Expected exit code: `12`.
Then swap the numbers (`12` in `w1`, `7` in `w2`): it must still return `12`.
(Hint: `mov` can copy one box into another: `mov w0, w1`.)

**5.** `03-sum.s` – compute `1 + 2 + 3 + … + 10`. Expected exit code: `55`.
(Hint: you need two boxes: one for the counter, going from 1 to 10, and one for the sum.)

**6.** `04-countdown.s` – start `w0` at `10` and subtract 1 until it reaches `0`. Expected exit code: `0`.
(Hint: this time the loop goes on while the number is **greater than** 0.)

**7.** `05-factorial.s` – compute `5! = 5 * 4 * 3 * 2 * 1`. Expected exit code: `120`.
(Hint: remember from topic 01 that `mul` only works with boxes.)

## Part 3 – Look inside (optional)

**8.** Open the loop in lldb (in a real terminal, not through Claude):

```bash
make dbg/02-control-flow/01-loop
```

Type `b main`, `run`, and then repeat `si` and `register read w0` a few times.
Watch the `->` arrow go **back up** after the `b.lt`, and `w0` grow by 1 each time around. Type `quit` to leave.
