.model small
.data
n1 db 23h
odd db ?
eve db ?

.code
mov ax,@data
mov ds,ax
mov al,n1
test al,01
jz label1
mov odd,1
jmp stop
label1 : mov eve,1
stop : mov ah,4ch
        int 21h
        end
