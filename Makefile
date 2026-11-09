# Usage:
#   make 01-basics/00-exit        assembles 01-basics/00-exit.s into build/01-basics/00-exit
#   make run/01-basics/00-exit    builds it, runs it and prints the exit code
#   make dis/01-basics/00-exit    disassembles the built program (what the CPU really gets)
#   make dbg/01-basics/00-exit    opens it in lldb
#   make all                      builds every exercise
#   make clean                    removes build/
CC      = clang
ASFLAGS = -g
BUILD   = build

# Every exercise, e.g. 01-basics/00-exit (the .s files without the extension)
PROGS = $(patsubst %.s,%,$(wildcard [0-9][0-9]-*/*.s))
RUNS  = $(addprefix run/,$(PROGS))
DISS  = $(addprefix dis/,$(PROGS))
DBGS  = $(addprefix dbg/,$(PROGS))

# No built-in rules: otherwise make would build next to the source
MAKEFLAGS += -r
.SUFFIXES:

.PHONY: help all clean $(PROGS) $(RUNS) $(DISS) $(DBGS)
help:
	@echo "Build an exercise:  make 01-basics/00-exit   (output in build/)"
	@echo "Build and run it:   make run/01-basics/00-exit"
	@echo "With arguments:     make run/01-basics/00-exit ARGS=\"1 2 3\""
	@echo "Disassemble it:     make dis/01-basics/00-exit"
	@echo "Debug it in lldb:   make dbg/01-basics/00-exit"
	@echo "Build everything:   make all"
	@echo "Remove binaries:    make clean"

all: $(PROGS)

clean:
	rm -rf $(BUILD)

# clang assembles the .s and calls the linker (ld), which needs _main and libSystem on macOS
$(BUILD)/%: %.s
	@mkdir -p $(dir $@)
	$(CC) $(ASFLAGS) $< -o $@

# make 01-basics/00-exit → build/01-basics/00-exit
$(PROGS): %: $(BUILD)/%

# The exit code is the easiest way to get a number out of a program with no printf
$(RUNS): run/%: $(BUILD)/%
	@./$< $(ARGS); echo "[exit code: $$?]"

$(DISS): dis/%: $(BUILD)/%
	@objdump -d --no-show-raw-insn $<

$(DBGS): dbg/%: $(BUILD)/%
	@lldb ./$<
