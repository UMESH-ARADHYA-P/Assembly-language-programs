.model small
.data
.code
mov ax,@data
mov ds,ax

mov ah,2ch
int 21h

mov al,ch
call display

mov dl,':'
mov ah,02
int 21h

mov al,cl
call display

mov dl,':'
mov ah,02
int 21h
mov al,dh
call display
jmp l2
display proc
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
display endp

l2 :mov ah,4ch
int 21h

end
