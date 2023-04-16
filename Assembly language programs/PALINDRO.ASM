display macro m
lea dx,m
mov ah,09
int 21h
endm

.model small
.data
str1 db 30 dup('$')
m1 db 10,13,"Enter the string : $"
m2 db 10,13,"Palindrome :$"
m3 db 10,13,"Not a palindrome :$"
rev db 30 dup('$')
len dw 00

.code
mov ax,@data
mov ds,ax
mov es,ax

display m1

lea dx,str1
mov ah,10
int 21h

mov ch, 00
mov cl, str1[1]
mov len , cx
lea si, str1+2
lea di, rev
add di,cx
dec di
back: mov al,[si]
        mov [di],al
        inc si
        dec di
        loop back
        lea si,str1+2
        lea di,rev
        cld
        mov cx,len
        repe cmpsb
        jne fail
        display m2
        jmp stop
fail : display m3
stop : mov ah,4ch
        int 21h

       end

mov ah,4ch
int 21h
end
