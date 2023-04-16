.model small
.data
m1 db 10,13,"Enter the string $"
m2 db 10,13,"IT is Palindrome $"
m3 db 10,13,"it is not a palindrome $"
m4 db 10,13,"string is : $"
m5 db 10,13,"Reverse string is : $" 10,13
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

mov ch,0
mov cl,str[1]
mov len,cx

lea si,str+2
lea di,rev
add di,cx
dec di
l1 : mov al,[si]
     mov [di],al
     inc si
     dec di
     loop l1
lea si,str+2
lea di,rev
cld
mov cx,len
repe cmpsb
jne fail
lea dx,m2
mov ah,09
int 21h
jmp stop
fail: lea dx,m3
mov ah,09
int 21h
stop:lea dx,m4
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








