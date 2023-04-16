.model small
.data
msg db "HELLO$"
.code
mov ax,@data
mov ds,ax
mov ax,3
int 10h
mov ah,2
mov bh,0
mov dh,12
mov dl,40
int 10h
lea dx,msg
mov ah,9h
int 21h
mov ah,4ch
int 21h
end
