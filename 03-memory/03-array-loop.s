// Exercise 5: add the five numbers of an array with a loop.
//   make run/03-memory/03-array-loop   →   [exit code: 15]
//
// In C:  int array[] = {1, 2, 3, 4, 5};
//        int *x1 = array;  int w0 = 0;
//        for (int w3 = 5; w3 > 0; w3--) { w0 = w0 + *x1; x1++; }
//        return w0;

.global _main
.p2align 2

_main:
    adrp x1, array@PAGE         // x1 = the address of the first number
    add  x1, x1, array@PAGEOFF
    mov  w0, #0                 // sum = 0
    mov  w3, #5                 // numbers left = 5

loop:
    ldr  w2, [x1]               // w2 = the number at x1
    add  w0, w0, w2             // sum = sum + that number
    add  x1, x1, #4             // move x1 to the next number (4 bytes later)
    sub  w3, w3, #1             // one less number left
    cmp  w3, #0
    b.gt loop                   // still numbers left? go back up

    ret                         // return the sum → 15

.data
.p2align 2
array: .word 1, 2, 3, 4, 5
