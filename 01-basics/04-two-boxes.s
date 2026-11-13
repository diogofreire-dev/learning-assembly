// Exercise 6: put 20 in w0 and 22 in w1, then add w1 to w0.
//   make run/01-basics/04-two-boxes   →   [exit code: 42]
//
// In C:  int w0 = 20;  int w1 = 22;  w0 = w0 + w1;  return w0;

.global _main
.p2align 2

_main:
    mov w0, #20         // w0 = 20
    mov w1, #22         // w1 = 22   (a second box)
    add w0, w0, w1      // w0 = w0 + w1   (no # this time: w1 is a box, not a number)
    ret                 // return w0 → 42   (only w0 counts, w1 is ignored)
