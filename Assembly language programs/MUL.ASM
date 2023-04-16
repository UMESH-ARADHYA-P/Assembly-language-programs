.model small
.data
n1 dw 02h
n2 dw 03h
c dw ?

.code
mov ax,@data
mov ds,ax
mov ax,n1
mov sp,n2
mul sp
mov c,ax
mov c+2,dx
mov ah,4ch
int 21h
end
