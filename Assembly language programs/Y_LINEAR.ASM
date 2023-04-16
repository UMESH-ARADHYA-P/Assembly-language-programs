.model small
.data
arr db 10,12,14,15,16,19
found db 00
key db 34
m1 db 10,13,"found $"
m2 db 10,13,"not found $"

.code
mov ax,@data
mov ds,ax

mov cx,6
mov al,key
lea si,arr

l1 : cmp al,arr[si]
     je suc
     inc si
     loop l1
 lea dx,m2
 mov ah,09
 int 21h
jmp stop
suc :    lea dx,m1
        mov ah,09
        int 21h
stop : mov ah,4ch
        int 21h
        end

