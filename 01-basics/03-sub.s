// Exercise 5: put 10 in w0, then subtract 4.
//   make run/01-basics/03-sub   →   [exit code: 6]
//
// In C:  int w0 = 10;  w0 = w0 - 4;  return w0;

.global _main
.p2align 2

_main:
    mov w0, #10         // w0 = 10
    sub w0, w0, #4      // w0 = w0 - 4
    ret                 // return w0 → 6
