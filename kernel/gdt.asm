gdtstart:
    ;THIS STARTS GDT NULL
gdtnull:
    dd 0x00
    dd 0x00

gdtcode:
    ; base=0x0, limit=0xfffff , 
    ; 1st flags: (present)1 (privilege)00 (type)1 -> 1001b
    ; type flags: (code)1 (conforming)0 (readable)1 (accessed)0 -> 1010b
    ; 2nd flags: (granularity)1 (32-bit default)1 (64-bit seg)0 (AVL)0 -> 1100b
    dw 0xffff    ; Limit (bits 0-15)
    dw 0x00       ; Base (bits 0-15)
    db 0x00       ; Base (bits 16-23)
    db 10011010b ; 1st flags , type flags
    db 11001111b ; 2nd flags , Limit (bits 16-19)
    db 0x00       ; Base (bits 24-31)

gdtdata:
    dw 0xffff    ; Limit (bits 0-15)
    dw 0x00       ; Base (bits 0-15)
    db 0x00       ; Base (bits 16-23)
    db 10010010b ; 1st flags , type flags
    db 11001111b ; 2nd flags , Limit (bits 16-19)
    db 0x00       ; Base (bits 24-31)

gdtend:

gdtdescriptor:
    dw gdtend - gdtstart - 1
    dd gdtstart

CODESEG equ gdtcode - gdtstart
DATASEG equ gdtdata - gdtstart