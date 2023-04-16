.model small
.data
m1 db 10,13,"Enter the string 1 : $"
m2 db 10,13,"Enter the string 2 : $"
m3 db 10,13,"Equal  $"
m4 db 10,13,"Not Equal $"
len1 dw 00
str1 db 20 dup('$')
str2 db 20 dup('$')


.code
mov ax,@data
mov ds,ax
mov es,ax
lea dx,m1
mov ah,09
int 21h

lea dx,str1
mov ah,10
int 21h

mov cl,str1[1]
mov ch,00
mov len1,cx

lea dx,m2
mov ah,09
int 21h

lea dx, str2
mov ah,10
int 21h
mov ch,00
mov cl,str2[1]
cmp len1,cx
jne fail

mov cx,len1
lea si,str1+2
lea di,str2+2
cld
repe cmpsb
jnz fail
lea dx,m3
mov ah,09
int 21h
jmp stop
fail: lea dx,m4
mov ah,09
int 21h

stop : mov ah,4ch
int 21h

end



