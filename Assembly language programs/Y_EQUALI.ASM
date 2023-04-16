.model small
.data
m1 db 10,13,"Enter the string_1 $"
m2 db 10,13,"Enter the string_ 2 $"
m3 db 10,13,"strings are equal $"
m4 db 10,13,"strings are not equal $"
str1 db 20 dup('$')
str2 db 20 dup('$')
len1 db ?
len2 dw ?

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

lea dx,m2
mov ah,09
int 21h

lea dx,str2
mov ah,10
int 21h

mov cl,str1[1]
mov len1 ,cl
mov cl,str2[1]
cmp len1,cl
jnz note
mov ch,00
lea si,str1
lea di,str2
cld
repe cmpsb
jnz note

lea dx,m3
mov ah,09
int 21h
jmp stop
note : lea dx,m4
       mov ah,09
       int 21h
stop : mov ah,4ch
       int 21h

       end

