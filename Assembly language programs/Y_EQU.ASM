.model small
.data
m1 db 10,13,"enter the sring 1 $"
m2 db 10,13,"Enter the string 2; $"
str1 db 20 dup('$')
str2 db 20 dup('$')
m3 db 10,13,"strings are equal $"
m4 db 10,13,"not equal  $"

len db ?

.code
mov ax,@data
mov ds,ax
mov es,ax

lea dx ,m1
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
mov len,cl
mov cl,str2[1]
cmp cl,len
jnz  fail

lea si,str1+2
lea di,str2+2
cld
repe cmpsb
jne fail
lea dx,m3
mov ah,09
int 21h
jmp stop
fail : lea dx,m4
        mov ah,09
        int 21h
stop  :mov ah,4ch
int 21h
end
