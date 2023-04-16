.model small
.data
key db 44h
arr db 11h,22h,33h,44h,55h
n db 05h
found db 0

.code
mov ax,@data
mov ds,ax
mov cx,05
mov si,0
mov al,key
start : cmp al,[si]
        je success
        inc si
        loop start
        jmp stop

success : mov found,1
stop :   mov ah,4ch
         int 21h
         end

