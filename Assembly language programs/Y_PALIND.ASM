.model small
.data
m1 db 10,13,"Enter the string $"
m2 db 10,13,"It is Palilndrome $"
m3 db 10,13,"Not a palindrome $"
m4 db 10,13,"The string is $"
m5 db 10,13,"The reverse string is $"
str db 20 dup('$')
rev db 20 dup('$')


len dw 00

.code
mov ax,@data
mov ds,ax
mov es,ax

lea dx,m1
mov ah,09
int 21h

lea dx,str
mov ah,10
int 21h

mov cl,str[1]
mov ch,00
mov len,cx

lea si,str+2
lea di,rev
add di,cx
dec di

l1: mov al,[si]
    mov [di],al
    inc si
    dec di
    loop l1

mov cx,len
lea si,str+2
lea di,rev
cld
repe cmpsb
jnz notp
lea dx,m2
mov ah,09
int 21h
jmp exit
notp : lea dx,m3
       mov ah,09
       int 21h
exit: lea dx,m4
      mov ah,09
      int 21h

      lea dx,str+2
      mov ah,09
      int 21h

      lea dx,m5
      mov ah,09
      int 21h

      lea dx,rev
      mov ah,09
      int 21h

mov ah,4ch
int 21h

end

