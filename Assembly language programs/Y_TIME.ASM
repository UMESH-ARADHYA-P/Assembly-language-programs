.model small
.data
m1 db 10,13," the time is : $"


.code

mov ax,@data
mov ds,ax

mov ah,2ch
int 21h

mov al,ch
call output

mov dl,':'
mov ah,02
int 21h

mov al,cl
call output

mov dl,":"
mov ah,02
int 21h

mov al,dh
call output

mov ah,4ch
int 21h


output proc
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
output endp

end
