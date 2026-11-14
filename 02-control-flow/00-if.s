// An if: return 1 if w1 is 5, otherwise return 0.
//   make run/02-control-flow/00-if   →   [exit code: 1]
//
// In C:  if (w1 == 5) return 1;  return 0;

.global _main
.p2align 2

_main:
    mov w1, #5          // the number to test (change it and run again!)
    cmp w1, #5          // compare w1 with 5 (the CPU remembers the result)
    b.eq equal          // if they were equal, jump to "equal"

    // not equal: the jump did not happen, so we land here
    mov w0, #0          // return 0
    ret

equal:
    mov w0, #1          // return 1
    ret
