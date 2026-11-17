// Add the three numbers of an array.
//   make run/03-memory/01-array   →   [exit code: 42]
//
// In C:  int array[] = {10, 20, 12};
//        return array[0] + array[1] + array[2];

.global _main
.p2align 2

_main:
    adrp x1, array@PAGE         // x1 = the address of array (its first int)
    add  x1, x1, array@PAGEOFF

    ldr  w0, [x1]               // w0 = array[0] → 10   (address x1 + 0)
    ldr  w2, [x1, #4]           // w2 = array[1] → 20   (each int is 4 bytes: x1 + 4)
    add  w0, w0, w2             // w0 = 30
    ldr  w2, [x1, #8]           // w2 = array[2] → 12   (x1 + 8)
    add  w0, w0, w2             // w0 = 42
    ret

.data
.p2align 2
array: .word 10, 20, 12         // three ints, one after the other
