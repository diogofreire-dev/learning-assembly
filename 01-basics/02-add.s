// Exercise 4: put 5 in w0, then add 3 to it.
//   make run/01-basics/02-add   →   [exit code: 8]
//
// In C:  int w0 = 5;  w0 = w0 + 3;  return w0;

.global _main
.p2align 2

_main:
    mov w0, #5          // w0 = 5
    add w0, w0, #3      // w0 = w0 + 3   (result box first, then the two things to add)
    ret                 // return w0 → 8
