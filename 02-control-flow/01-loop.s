// A loop: count from 0 to 10.
//   make run/02-control-flow/01-loop   →   [exit code: 10]
//
// In C:  int w0 = 0;  do { w0 = w0 + 1; } while (w0 < 10);  return w0;

.global _main
.p2align 2

_main:
    mov w0, #0          // counter = 0

loop:
    add w0, w0, #1      // counter = counter + 1
    cmp w0, #10         // compare the counter with 10
    b.lt loop           // still less than 10? go back up to "loop"

    // the jump did not happen: the counter reached 10
    ret                 // return 10
