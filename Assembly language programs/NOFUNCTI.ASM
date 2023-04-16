include m1.mac
include m2.mac

.model small
.data
m1 db 10,13,"Enter the string : $"
m2 db 10,13,"The string is : $"
len dw 00
str db 20 dup('$')

.code
mov ax,@data
mov ds,ax
mov es,ax

lea dx,m1
mov ah,09
int 21h
lea si,str
l1:mmp
   cmp al,13
   je output
   mov [si],al
   inc si
   inc len
   jmp l1

output:mov cx,len
lea dx,m2
mov ah,09
int 21h
lea si,str

l3 :mov dl,[si]
    mp
    inc si
    loop l3
mov ah,4ch
int 21h

end
