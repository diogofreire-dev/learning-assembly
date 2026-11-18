// Exercise 7: count the letters of a string (like strlen in C).
//   make run/03-memory/05-strlen   →   [exit code: 5]
//
// In C:  char text[] = "Hello";
//        char *x1 = text;  int w0 = 0;
//        while (*x1 != 0) { w0++; x1++; }
//        return w0;

.global _main
.p2align 2

_main:
    adrp x1, text@PAGE
    add  x1, x1, text@PAGEOFF
    mov  w0, #0                 // count = 0

loop:
    ldrb w2, [x1]               // w2 = one byte (one letter) at x1
    cmp  w2, #0                 // is it the 0 at the end of the string?
    b.eq done                   // yes: stop
    add  w0, w0, #1             // no: count it
    add  x1, x1, #1             // move to the next letter (1 byte later, not 4)
    b    loop                   // always go back up

done:
    ret                         // return the count → 5

.data
text: .asciz "Hello"            // H e l l o 0   (asciz adds the 0 at the end)
