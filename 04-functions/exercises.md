# 04 – Functions: exercises

Read `notes.md` first. Do them in order.

Run every exercise from the repository root with `make run/04-functions/<name>`.

## Part 1 – Change the examples

**1.** Run `00-call`. Then change the `21` to `50` and run it again. Expected exit code: `100`.

**2.** In `00-call.s`, delete (or comment out with `//`) the `stp` and `ldp` lines in `main`, and run it.
The program never ends — press `Ctrl+C` to stop it. Why? Think about what is in `x30` when `main` does its `ret`.

**3.** In `00-call.s`, call `double_it` **twice** in a row (two `bl double_it` lines). Expected exit code: `84`.
(Hint: the result of the first call is already in `w0`, which is exactly where the second call wants its argument.)

## Part 2 – Write your own

For each one, create a new file in `04-functions/` (start by copying one of the examples) and check the exit code.

**4.** `02-max-func.s` – write a function `max` that takes two numbers in `w0` and `w1` and returns the bigger one. `main` calls `max(7, 12)`. Expected exit code: `12`.
(Hint: `02-max.s` from topic 02, but now the numbers arrive in `w0` and `w1`.)

**5.** `03-sum-func.s` – write a function `sum` that takes the **address** of an array in `x0` and how many numbers it has in `w1`, and returns their sum. `main` calls it with `.word 1, 2, 3, 4, 5` and `5`. Expected exit code: `15`.
(Hint: `03-array-loop.s` from topic 03. This is how C passes an array to a function: as a pointer.)

**6.** `04-quadruple.s` – keep `double_it` and write a function `quadruple` that calls `double_it` twice. `main` calls `quadruple(10)`. Expected exit code: `40`.
(Hint: `quadruple` now calls someone too — what does it need at the start and at the end?)

## Part 3 – Look inside (optional)

**7.** Watch `x30` being saved on the stack (in a real terminal, not through Claude):

```bash
make dbg/04-functions/00-call
```

Type `b main`, `run`, and then:

```
register read x30 sp
si
memory read --size 8 --format x --count 2 $sp
```

After the `stp`, the second number in memory is the same as `x30`: main's "come back here" note is now sitting on the stack.
Keep doing `si` and `register read x30` to see `bl` change `x30`, and `ldp` bring the old value back. Type `quit` to leave.
