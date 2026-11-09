// Hello world with no libc: ask the kernel directly with the write system call.
//   make run/01-basics/01-hello
//
// In C this would be:  write(1, msg, len); return 0;
//
// macOS system call convention on ARM64:
//   x16      = system call number (write is 4, exit is 1)
//   x0..x5   = arguments
//   svc #0x80 traps into the kernel

.global _main
.p2align 2

_main:
    mov x0, #1                  // 1st argument: file descriptor 1 (stdout)
    adrp x1, msg@PAGE           // 2nd argument: address of msg, in two steps —
    add x1, x1, msg@PAGEOFF     //   the 4 KB page it lives in, then the offset inside the page
    mov x2, #len                // 3rd argument: number of bytes
    mov x16, #4                 // system call 4 = write
    svc #0x80

    mov w0, #0                  // return 0
    ret

.section __TEXT,__const         // read-only data
msg:
    .ascii "Hello, ARM64!\n"
len = . - msg                   // "." is the current address, so this is the length of msg
