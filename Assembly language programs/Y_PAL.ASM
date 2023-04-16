.model small
.data
m1 db 10,13,"enter the string $"
m2 db 10,13,"the string is palindrome $"
m4 db 10,13,"the string is $"
m5 db 10,13,"The reverse string is $"
m3 db 10,13,"Not a palindrome $"
str db 20 dup('$')
rev db 20 dup('$')
len dw ?

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
mov ch,00
mov cl,str[1]

mov len,cx
lea si,str+2
lea di,rev
add di,cx
dec di

l1:  mov al,[si]
      mov [di],al
      inc si
      dec di
      loop l1
mov cx,len

lea si,str+2
lea di,rev
repe cmpsb
jne fail
lea dx,m2
mov ah,09
int 21h
jmp stop
fail : lea dx,m3
        mov ah,09
        int 21h
stop : lea dx,m4
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
