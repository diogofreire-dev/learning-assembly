// Exercise 4: return the bigger of w1 and w2.
//   make run/02-control-flow/02-max   →   [exit code: 12]
//
// In C:  int w0 = w1;  if (w1 < w2) w0 = w2;  return w0;
//
// Idea: guess that w1 is the bigger one, then fix the guess if it was wrong.

.global _main
.p2align 2

_main:
    mov w1, #7          // first number
    mov w2, #12         // second number (swap them: the result must still be 12)

    mov w0, w1          // guess: w1 is the bigger one
    cmp w1, w2          // compare w1 with w2
    b.ge done           // w1 >= w2? the guess was right, skip the fix

    mov w0, w2          // the guess was wrong: w2 is the bigger one

done:
    ret                 // return w0 → 12
