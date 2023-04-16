.model small
.data
m1 db 10,13,"The time is :$"
h db ?
.code
mov ax,@data
mov ds,ax

mov ah,2ch
int 21h
mov h,dh

lea dx,m1
mov ah,09
int 21h

mov al,ch
call disp

mov dl,":"
mov ah,02
int 21h




mov al,cl
call disp

mov dl,":"
mov ah,02
int 21h

mov al,h
call disp

jmp s


disp proc
aam
add ax, 3030h
mov bx,ax
mov dl,bh
mov ah,02
int 21h

mov dl,bl
mov ah,02
int 21h

ret
disp endp

s: mov ah,4ch
int 21h
end
