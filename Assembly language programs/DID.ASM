.model small
.data
a db 6
b db 3
rem db ?
quo db ?

.code
mov ax,@data
mov ds,ax
mov ah,00
mov al,a
mov bl,b
div bl
mov dl,ah
mov cl,al
mov ah,4ch
int 21h

end
