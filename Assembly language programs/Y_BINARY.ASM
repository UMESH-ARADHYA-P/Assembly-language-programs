.model small
.data
arr dw 1111h,2222h,3333h,4444h,5555h
n dw (n-arr)/2
found dw 00
key dw 444h
m1 db 10,13,"Found $"
m2 db 10,13,"not found $"

.code
mov ax,@data
mov ds,ax

mov bx,0
mov dx,n
mov ax,key
l1 :  cmp bx,dx
      jg exit
      mov si,bx
      add si,dx
      shr si,1
      mov cx,si
      add si,si
      sub si,02
      cmp ax,arr[si]
      je success
      jg next
      mov dx,cx
      dec dx
      jmp l1
next : mov bx,cx
       inc bx
       jmp l1
success :lea dx,m1
         mov ah,09
         int 21h
         jmp l4
 exit: lea dx,m2
         mov ah,09
         int 21h
 l4: mov ah,4ch
int 21h

end
