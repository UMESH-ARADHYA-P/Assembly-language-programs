.model small
.data
arr db 11h,22h,33h,44h,55h
key db 87h
n db 5
found db 00
m1 db 10,13," found $"
m2 db 10,13," Not found $"

.code
mov ax,@data
mov ds,ax

mov ch,00
mov cl,5
mov al,key
mov si,0

l1:cmp al,arr[si]
   jz got
   inc si
   loop l1
   jmp l3
got : mov found, 01
      lea dx,m1
      mov ah,09
      int 21h
      jmp stop

l3: lea dx,m2
   mov ah,09
   int 21h

   
   
stop : mov ah,4ch
int 21h
end
