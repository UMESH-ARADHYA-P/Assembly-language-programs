.model small
.data
arr db 09h,03h,06h,04h,02h,90h

.code
mov ax,@data
mov ds,ax

mov cx,6
dec cx

l1 : mov bx,cx
     lea si,arr
l2 : mov al,[si]
     mov dl,[si+1]
     cmp al,dl
     jle noswap
     mov [si],dl
     mov [si+1],al
noswap : inc si
         dec bx
         jnz l2
         loop l1
mov ah,4ch
int 21h
end
