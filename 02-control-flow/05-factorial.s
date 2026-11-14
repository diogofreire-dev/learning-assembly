// Exercise 7: compute 5! = 5 * 4 * 3 * 2 * 1.
//   make run/02-control-flow/05-factorial   →   [exit code: 120]
//
// In C:  int w0 = 1;  for (int w1 = 5; w1 > 1; w1--) w0 = w0 * w1;  return w0;
//
// The result starts at 1, not 0: anything times 0 is 0.

.global _main
.p2align 2

_main:
    mov w0, #1          // result = 1
    mov w1, #5          // counter = 5

loop:
    mul w0, w0, w1      // result = result * counter   (mul needs two boxes)
    sub w1, w1, #1      // counter = counter - 1
    cmp w1, #1          // compare the counter with 1
    b.gt loop           // still greater than 1? go back up (times 1 changes nothing)

    ret                 // return the result → 120
