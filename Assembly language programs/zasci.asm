.model small
.data
m1 db 10,13,"Enter the character $"
char db ?
row db 11
col db 39


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
mov dh,row
mov dl,col
mov bx,0
int 10h


mov dl,char
mov ah,02
int 21h

mov cl,04
mov al,char
shr al, cl
cmp al,09
jle l2
add al,07h
l2:add al,30h
mov dl,al
mov ah,02
int 21h

mov al,char
and al,0fh
cmp al,09
jle l3
add al,07h
l3: add al,30h
mov dl,al
mov ah,02
int 21h



mov ah,4ch
int 21h
end
