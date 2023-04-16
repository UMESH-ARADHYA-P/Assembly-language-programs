.model small
.data
m1 db 10,13,"Enter the row $"
m2 db 10,13, "Enter the column $"
m3 db 10,13,"Enter the character $"
row db ?
col db ?
char db ?



.code
mov ax,@data
mov ds,ax

lea dx,m3
mov ah,09
int 21h

mov ah,01
int 21h
mov char,al

lea dx,m1
mov ah,09
int 21h

call input
mov row,al

lea dx,m2
mov ah,09
int 21h
call input

mov col ,al

mov ah,02
mov dh,0
mov dl,0
mov bx,0
int 21h

mov cx,1920
l1: mov dx," "
     mov ah,02
     int 21h
     loop l1

mov ah,02
mov dh,row
mov dl,col
mov bx,0
int 10h

mov dl,char
mov ah,02
int 21h

mov ah,4ch
int 21h

input proc
mov ah,01
int 21h
mov cl,al
mov ah,01
int 21h
mov ah,cl
sub ax,3030h
aad
ret
input endp


end
