;Start off the code

org 0x7C00 ;load from this address
bits 16 ;16 bit mode

start:
	cli 
	mov si, msg ;point si to msg
	mov ah, 0x0E ;tell the BIOS we are printing chars
.loop lodsb ;loop through chars
	or al, al ;check if string is finished
	jz halt ;jump to halt if we are done 
	int 0x10 
	jmp .loop 

halt: hlt
msg: db "Incredible this actually works", 0

;This identifies the code as a bootloader 
;It gets to bytes 511 and 512 then uses data write to put 0xAA, 0x55
times 510 - ($ - $$) db 0
dw 0xAA55
