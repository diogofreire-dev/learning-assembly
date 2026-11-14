// Exercise 6: start at 10 and subtract 1 until reaching 0.
//   make run/02-control-flow/04-countdown   →   [exit code: 0]
//
// In C:  int w0 = 10;  do { w0 = w0 - 1; } while (w0 > 0);  return w0;

.global _main
.p2align 2

_main:
    mov w0, #10         // start at 10

loop:
    sub w0, w0, #1      // w0 = w0 - 1
    cmp w0, #0          // compare with 0
    b.gt loop           // still greater than 0? go back up

    ret                 // return 0
