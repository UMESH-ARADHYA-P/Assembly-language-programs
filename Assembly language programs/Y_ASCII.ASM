.model small
.data
m1 db 10,13,"Enter the character $"
char db ?

.code
mov ax,@data
mov ds,ax

lea dx,m1
mov ah,09
int 21h

mov ah,01
int 21h
mov char,al

mov ah,02
mov dh,0
mov dl,0
mov bx,0
int 10h

mov cx,1920

l1: mov dl,' '
    mov ah,02
    int 21h
    loop l1

mov ah,02
mov dh,10
mov dl,39
mov bx,0
int 10h

mov dl,char
mov ah,02
int 21h

mov dl,"-"
mov ah,02
int 21h

mov al,char
mov cl,4
shr al,cl
cmp al,9
jle nex1
add al,7
nex1: add al,30h
      mov dl,al
      mov ah,02
      int 21h
mov al,char
and al,0fh
cmp al,09
jle next2
add al,7
next2 : add al,30h
        mov dl,al
        mov ah,02
        int 21h
mov ah,4ch
int 21h
end
