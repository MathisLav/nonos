# Nonos Makefile

bios src/main.c src/entrypoint.s:
	rm -rf obj/
	mkdir obj
	riscv32-unknown-elf-gcc -nostdlib -ggdb -c src/main.c -o obj/main.o -O3
	riscv32-unknown-elf-as src/entrypoint.s -o obj/entrypoint.o
	riscv32-unknown-elf-ld -T include/virt.lds obj/* -o bios -O3

debug:
	qemu-system-riscv32 -s -S -nographic -machine virt -bios bios

gdb:
	gdb-multiarch bios -ex "target remote :1234" -ex "layout reg" -ex "b main" -ex "c"

qemu:
	qemu-system-riscv32 -nographic -machine virt -bios bios

asm:
	riscv32-unknown-elf-objdump -d bios

.PHONY: debug gdb qemu asm
