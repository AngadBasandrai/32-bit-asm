CODE_SEG equ code_descriptor - GDT_Start ; pointer to code segment
DATA_SEG equ data_descriptor - GDT_Start ; pointer to data segment

GDT_Start:
    null_descriptor:
        dd 0
        dd 0
    code_descriptor:
        dw 0xFFFF ; limit low
        dw 0 ; base low
        db 0 ; base middle
        db 10011010b ; access
        db 11001111b ; granularity
        db 0 ; base high
    data_descriptor:
        dw 0xFFFF ; limit low
        dw 0 ; base low
        db 0 ; base middle
        db 10010010b ; access
        db 11001111b ; granularity
        db 0 ; base high
    GDT_End:

GDT_Descriptor:
    dw GDT_End - GDT_Start - 1 ; size of gdt
    dd GDT_Start ; pointer to beggining of gdt