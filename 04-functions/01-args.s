// A function with three arguments: add3(10, 20, 12).
//   make run/04-functions/01-args   →   [exit code: 42]
//
// In C:  int add3(int a, int b, int c) { return a + b + c; }
//        int main(void) { return add3(10, 20, 12); }

.global _main
.p2align 2

_main:
    stp  x29, x30, [sp, #-16]!  // save x30
    mov  w0, #10                // 1st argument (a) in w0
    mov  w1, #20                // 2nd argument (b) in w1
    mov  w2, #12                // 3rd argument (c) in w2
    bl   add3                   // w0 = add3(10, 20, 12)
    ldp  x29, x30, [sp], #16    // take x30 back
    ret                         // return 42

add3:
    add  w0, w0, w1             // w0 = a + b
    add  w0, w0, w2             // w0 = a + b + c   (the result goes in w0)
    ret
