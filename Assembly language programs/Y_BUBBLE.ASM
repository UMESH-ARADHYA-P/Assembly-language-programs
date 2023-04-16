.model small
.data
arr db 09,03,02,01,05,07
m1 db 10,13,"The sorted array is $"


.code
mov ax,@data
mov ds,ax

lea si,arr
mov cx,06
dec cx

outerloop: mov bx,cx
            lea si,arr
cmploop  : mov al,[si]
            mov dl,[si+1]
            cmp al,dl
            jle nos
            mov [si],dl
            mov [si+1],al
     nos:  inc si
           
           dec bx
           jnz cmploop
           loop outerloop

lea dx,m1
mov ah,09
int 21h

lea si,arr
mov cx,6
l1 : mov al,[si]
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
     loop l1




 mov ah,4ch
 int 21h


 end
