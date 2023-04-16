
include mm1.mac
include mm2.mac
.model small
.data
m1 db 10,13,"Enter the string $"
m2 db 10,13,"The string is $"
str db 20 dup('$')
len dw ?

.code

mov ax,@data
mov ds,ax
mov es,ax

lea dx,m1
mov ah,02
int 21h

lea si,str

l1: inp
    cmp al,13
    je output
    mov [si],al
    inc si
    inc len
    jmp l1

lea dx,m2
mov ah,09
int 21h
lea si,str
mov cx,len
output : mov dl,[si]
         op
         inc si
         loop output

mov ah,4ch
int 21h
end 
