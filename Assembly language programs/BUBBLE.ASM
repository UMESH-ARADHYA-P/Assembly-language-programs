

.model small
.data

m1 db 10,13,"Sorted array is $"

arr db 90,50,40,30,20,33

.code
mov ax,@data
mov ds,ax

lea si,arr
mov cx,6
dec cx
outloop:mov bx,cx
        lea si,arr
cmploop : mov al,[si]
          mov dl,[si + 1]
           cmp al,dl
          jle noswap

          mov [si],dl
          mov [si+1],al

 noswap : inc si
          dec bx
          jnz cmploop
          loop outloop


lea dx,m1
mov ah,09
int 21h

mov cx,6
lea si,arr

l : mov al,[si]
    aam
    add ax,3030h
    mov bx,ax
    mov dl,bh
    mov ah,02
    int 21h

    mov dl,bl
    mov ah,02
    int 21h

    mov dl," "
    mov ah,02
    int 21h
    inc si
    loop l

mov ah,4ch
int 21h

end
