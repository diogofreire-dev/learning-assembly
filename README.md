# learning-assembly

Assembly exercises, the next step after [learning-c](https://github.com/diogofreire-dev/learning-c).

## Goal

Read and write Assembly well enough to understand what a compiled program really does, as a foundation for reverse engineering and binary exploitation.

I am choosing a course to follow, and the order of the topics below may change to match it. This Mac runs **ARM64**; most CTF and exploitation material uses **x86-64 on Linux**.

## Plan (by topic)

Folders are added one at a time, as I get to each topic.

- [ ] 00 – How it works: the CPU, registers, memory, instructions (big picture, no code)
- [ ] 01 – Basics: registers, `mov`, arithmetic, exit codes, system calls
- [ ] 02 – Control flow: `cmp`, flags, branches, loops
- [ ] 03 – Memory: `ldr`/`str`, addressing modes, data sections, arrays and strings
- [ ] 04 – Functions: `bl`/`ret`, the calling convention, the stack frame
- [ ] 05 – Mixing with C: calling libc from Assembly and Assembly from C
- [ ] 06 – Mini-Project
- [ ] 07 – x86-64 on Linux: registers, AT&T vs Intel syntax, system calls, the same exercises again

Each folder has a `notes.md` and, from topic 01 on, the exercises (`.s`).

## How to build

From the repository root:

```bash
make run/01-basics/00-exit      # build, run and print the exit code
make 01-basics/00-exit          # only build
make dis/01-basics/00-exit      # disassemble the built program
make dbg/01-basics/00-exit      # open it in lldb
make all                        # build every exercise
make clean                      # remove build/
```

Compiled programs go to `build/` (ignored by git).

## Resources

- Arm A64 instruction set reference
- pwn.college
- OverTheWire
