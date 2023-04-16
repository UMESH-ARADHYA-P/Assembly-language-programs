.model small
.data
arr dw 01h,02h,03h,04h,05h
n dw (n-arr)/2
found dw 00
key dw 09h
m1 db 10,13,"found $"
m2 db 10,13," not found $"

.code
mov ax,@data
mov ds,ax

mov bx,0
mov dx,n
mov ax,key

l1 : cmp bx,dx
      jg fail
      mov si,bx
      add si,dx
      shr si,1
      mov cx,si
      add si,si
      sub si,02
      cmp ax,arr[si]
      je success
      jg next
      mov dx,si
      dec dx
      jmp l1
next : mov bx,si
       inc bx
       jmp l1
success: mov found,01
        lea dx,m1
        mov ah,09
        int 21h
        jmp stop
fail : lea dx,m2
        mov ah,09
        int 21h
stop : mov ah,4ch
        int 21h

 end
