// Exercise 4: write 99 into a variable in memory, then read it back.
//   make run/03-memory/02-store   →   [exit code: 99]
//
// In C:  int var = 0;
//        int main(void) { int *x1 = &var; *x1 = 99; return *x1; }

.global _main
.p2align 2

_main:
    adrp x1, var@PAGE           // x1 = the address of var
    add  x1, x1, var@PAGEOFF

    mov  w2, #99                // str can only write a box, so put 99 in w2 first
    str  w2, [x1]               // memory at x1 = 99   (var was 0, now it is 99)

    ldr  w0, [x1]               // read it back: w0 = 99
    ret

.data                           // .data can be written to, so str works here
.p2align 2
var: .word 0                    // starts at 0
