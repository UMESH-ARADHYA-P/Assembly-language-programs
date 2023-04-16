.model small
.data
m1 db " MESSAGE $"
row db 10
col db 39
.code

mov ax,@data
mov ds,ax

mov ah,02
mov dh,0
mov dl ,0
mov bx,0
int 10h

mov cx,1930

l1: mov dl, ' '
mov ah,02
int 21h
loop l1

mov ah,02
mov dh,row
mov dl,col
mov bx,0
int 10h


lea dx,m1
mov ah,09
int 21h

mov ah,4ch
int 21h

end
