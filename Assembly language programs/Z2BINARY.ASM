.model small
.data
arr dw 1111h,2222h,3333h,4444h,5555h
n dw (n-arr)/2
found db 0
key dw 4444h
m3 db 10,13,"The found is : "

.code
mov ax,@data
mov ds,ax

mov bx,0
mov dx,n
mov ax,key

l1:cmp bx,dx
   jg fail
   mov si,bx
   add si,dx
   shr si,1
   mov cx,si
   add si,si
   sub si,02
   cmp ax, arr[si]
   je success
   jg next
   mov dx,si
   dec dx
   jmp l1
next: mov bx,si
     inc bx
     jmp l1
success : mov found ,1
fail: lea dx,m3
mov ah,09
int 21h


mov ah,4ch
int 21h

end
