// Read a number from memory and return it.
//   make run/03-memory/00-load   →   [exit code: 42]
//
// In C:  int number = 42;  int main(void) { int *x1 = &number; return *x1; }

.global _main
.p2align 2

_main:
    adrp x1, number@PAGE        // x1 = the address of number
    add  x1, x1, number@PAGEOFF //   (always these two lines)
    ldr  w0, [x1]               // w0 = the int stored at that address
    ret                         // return 42

.data                           // from here on: data, not instructions
.p2align 2
number: .word 42                // one int in memory (change it and run again!)
