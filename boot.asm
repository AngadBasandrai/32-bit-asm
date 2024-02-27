[org 0x7C00] ; start of bootloader

mov ah, 0x00 ; set video mode
mov al, 0x03 ; 80x25 text mode
int 0x10

cli
lgdt [GDT_Descriptor]

; change last bit of cr0 to 1

mov eax, cr0
or eax, 1 ; set last bit to 1
mov cr0, eax ; now in 32 bit mode

jmp CODE_SEG:start_32

[bits 32]
start_32:
    mov ah, 0x1F ; white on blue
    mov al, 'H'
    mov [TXT_VID_MEM], ax ; start of vid mem = 0xB8000
    jmp $

TXT_VID_MEM equ 0xB8000
GFX_VID_MEM equ 0xA0000

%include "gdt.asm"

times 510-($-$$) db 0 ; fill the rest of the sector with 0s         
dw 0xaa55 ; define the boot signature