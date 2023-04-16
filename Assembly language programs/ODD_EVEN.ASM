.model small
.data
odd db 0
ev db 0
n1 db 20h

.code
mov ax,@data
mov ds,ax

mov al,n1
test al,1
jz lable1
mov cx,01
jmp stop
lable1: mov dx,01
stop : mov ah,4ch
        int 21h
end
