default rel

section .rodata

global RED
global GREEN
global BLUE

RED   dd 0xff000000
GREEN dd 0x00ff0000
BLUE  dd 0x0000ff00

section .data

global base_color

base_color dd 0xffffff00

section .text

extern combining_function

global get_color_value
get_color_value:
    mov eax, [rdi]
    ret

global add_base_color
add_base_color:
    mov eax, [rdi]
    mov dword [base_color], eax
    ret

global make_color_combination
make_color_combination:
    mov r14, rdi
    mov edi, dword [base_color]
    mov esi, dword [rsi]
    call combining_function
    mov dword [r14], eax
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
