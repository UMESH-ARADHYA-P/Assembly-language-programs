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
mov char ,al


mov cl, 4
shr al,cl
cmp al,9
jle l2
add al,7
l2:add al,30h
mov dl,al
mov ah,02
int 21h

mov al,char
and al,0fh
cmp al,9
jle l5
add al,7
l5: add al,30h
    mov dl,al
    mov ah,02
    int 21h



mov ah,4ch
int 21h
end
