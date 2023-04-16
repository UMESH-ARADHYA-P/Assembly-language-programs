.model small
.data
a db 3
b db 4
c db ?

.code
mov ax,@data
mov ds,ax
mov al,a
mov bl,b
add al,al
mov c,ax

mov ah,4ch
int 21h
end
