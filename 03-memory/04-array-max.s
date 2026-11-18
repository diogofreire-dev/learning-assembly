// Exercise 6: find the biggest number in an array.
//   make run/03-memory/04-array-max   →   [exit code: 17]
//
// In C:  int array[] = {4, 17, 9, 2, 11};
//        int *x1 = array;  int w0 = *x1;          // guess: the first is the biggest
//        for (int w3 = 4; w3 > 0; w3--) { x1++; if (*x1 > w0) w0 = *x1; }
//        return w0;

.global _main
.p2align 2

_main:
    adrp x1, array@PAGE
    add  x1, x1, array@PAGEOFF
    ldr  w0, [x1]               // guess: the first number (4) is the biggest
    mov  w3, #4                 // 4 numbers left to check

loop:
    add  x1, x1, #4             // move to the next number
    ldr  w2, [x1]               // w2 = that number
    cmp  w0, w2                 // compare the biggest so far with it
    b.ge skip                   // biggest so far >= it? keep the guess
    mov  w0, w2                 // it is bigger: it becomes the new biggest
skip:
    sub  w3, w3, #1             // one less number left
    cmp  w3, #0
    b.gt loop                   // still numbers left? go back up

    ret                         // return the biggest → 17

.data
.p2align 2
array: .word 4, 17, 9, 2, 11
