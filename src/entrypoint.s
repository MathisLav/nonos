# Entrypoint of the bootloader

.section .text
.globl _start

_start:
    la sp, _stacktop
    call main

    # Endless loop in case of unexpected return
end_loop:
    j end_loop
