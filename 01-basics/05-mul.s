// Exercise 7: compute 6 * 7.
//   make run/01-basics/05-mul   →   [exit code: 42]
//
// In C:  return 6 * 7;
//
// "mul w0, w0, #7" does not exist: mul only works with boxes, so both
// numbers go into registers first (clang says "invalid operand for instruction").

.global _main
.p2align 2

_main:
    mov w0, #6          // w0 = 6
    mov w1, #7          // w1 = 7
    mul w0, w0, w1      // w0 = w0 * w1
    ret                 // return w0 → 42
