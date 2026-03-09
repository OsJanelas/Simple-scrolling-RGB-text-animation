[bits 16]
[org 0x7c00]

switchtopm:
    cli
    lgdt [gdtdescriptor]
    
    mov eax, cr0
    or eax, 0x1
    mov cr0, eax

    jmp CODESEG:initpm

[bits 32]
initpm:
    mov ax, DATASEG
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp

    call BEGINPM

%include "kernel/gdt.asm"
%include "kernel/switch.asm"

times 510 - ($ - $$) db 0x00
dw 0xAA55