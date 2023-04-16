.model small
.data
m1 db 10,13,"The $"
row db 11
col db 20


.code
mov ax,@data
mov ds,ax

mov ah,02
mov dl,00
mov dh,00
mov bx,00
int 10h

mov cx,1920

l1:mov dx," "
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

