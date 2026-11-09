// The smallest useful program: return 42 from main.
//   make run/01-basics/00-exit   →   [exit code: 42]
//
// In C this would be:  int main(void) { return 42; }

.global _main           // make the symbol visible to the linker (macOS prefixes C names with _)
.p2align 2              // ARM64 instructions are 4 bytes and must be 4-byte aligned (2^2)

_main:
    mov w0, #42         // the return value goes in w0 (the low 32 bits of x0)
    ret                 // jump back to the address in x30 (the link register)
