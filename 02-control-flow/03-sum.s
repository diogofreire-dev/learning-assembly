// Exercise 5: compute 1 + 2 + 3 + ... + 10.
//   make run/02-control-flow/03-sum   →   [exit code: 55]
//
// In C:  int w0 = 0;  for (int w1 = 1; w1 <= 10; w1++) w0 = w0 + w1;  return w0;

.global _main
.p2align 2

_main:
    mov w0, #0          // sum = 0
    mov w1, #1          // counter = 1

loop:
    add w0, w0, w1      // sum = sum + counter
    add w1, w1, #1      // counter = counter + 1
    cmp w1, #10         // compare the counter with 10
    b.le loop           // still 10 or less? go back up

    ret                 // return the sum → 55
