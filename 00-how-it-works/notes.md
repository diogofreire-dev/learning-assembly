# 00 – How it works

The big picture, before any instruction. No code to write here.

## 1. The CPU only does tiny things

Add two numbers, copy a number from one place to another, compare two numbers, jump to another line.
Each of these tiny things is an **instruction**.

## 2. Two places to keep data

| Place | What it is | Size | Speed |
|---|---|---|---|
| **Registers** | little boxes inside the CPU, each with a name (`x0`, `x1`, …) | very few (about 30) | very fast |
| **Memory** (RAM) | where variables, arrays and strings live, each byte has an address | huge | slower |

## 3. A program is a list of instructions

The CPU runs them one by one, top to bottom, unless an instruction tells it to jump somewhere else.

## 4. Assembly is that list with readable names

The CPU really reads numbers. Assembly gives each instruction a name: `mov`, `add`, `ret`, …

## 5. C turns into this

When `clang` compiles C, each line becomes a few instructions. Learning Assembly is learning to read what is underneath my C.

## Example

```c
int main(void) { return 42; }
```

becomes (on this Mac, ARM64):

```asm
mov w0, #42    // put 42 in the box x0 (where the return value goes)
ret            // done, go back to whoever called me
```

See it run: `make run/01-basics/00-exit` → `[exit code: 42]`

## In my own words

-
