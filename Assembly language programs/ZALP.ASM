.model small
.data
msg db 10,13,"Enter any string $ "

include read.mac
include disp.mac
.code
mov ax,@data
mov ds,ax
lea dx,msg
mov ah,9
int 21h
repeat:read
cmp al,0dh
jz done
disp
jmp repeat
done:
mov ah,4ch
int 21h
end 
