.model small
.data
m1 db 10,13,"the time is :$"
m2 db 10,13,"row ? $"
m3 db 10,13,"col ? $"

row db 11
col db 39


.code

mov ax,@data
mov ds,ax



mov ah,02
mov dh,0
mov dl,0
mov bx,0
int 10h

mov cx,1920
back:mov dl," "
mov ah,02
int 21h
loop back

mov ah,02
mov dh,row
mov dl,col
mov bx,0
int 10h
mov ah,2ch
int 21h



mov al,ch
call dis

mov dl,":"
mov ah,02
int 21h

mov al,cl
call dis

mov dl,":"
mov ah,02
int 21h

mov al,dh
call dis



mov ah,4ch
int 21h

dis proc
mov ah,00
aam
add ax,3030h
mov bx,ax

mov dl,bh
mov ah,02
int 21h

mov dl,bl
mov ah,02
int 21h
ret
dis endp

end
