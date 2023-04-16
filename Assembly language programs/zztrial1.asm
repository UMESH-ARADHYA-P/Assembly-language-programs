.model small
.data
arr db 9h,6h,2h,4h,90h
res db ?
.code
mov ax,@data
mov ds,ax
mov ch,04h
l:
mov cl,04h
lea si,arr
l1:
mov al,[si]
mov bl,[si+1]
cmp al,bl
jc down
mov dl,[si+1]
xchg [si],dl
mov [si+1],dl
down:
inc si
dec cl
jnz l1
dec ch
jnz l
mov ah,4ch
int 21h
end