// Call a function: double_it(21).
//   make run/04-functions/00-call   →   [exit code: 42]
//
// In C:  int double_it(int x) { return x + x; }
//        int main(void) { return double_it(21); }

.global _main
.p2align 2

_main:
    stp  x29, x30, [sp, #-16]!  // save x30 (main's "come back here") on the stack
    mov  w0, #21                // the argument goes in w0
    bl   double_it              // jump to double_it; x30 = the address of the next line
    // double_it's ret lands here, with the result in w0
    ldp  x29, x30, [sp], #16    // take main's x30 back from the stack
    ret                         // return 42

double_it:                      // calls nobody, so it does not need stp/ldp
    add  w0, w0, w0             // w0 = w0 + w0
    ret                         // jump back to x30 (inside main)
