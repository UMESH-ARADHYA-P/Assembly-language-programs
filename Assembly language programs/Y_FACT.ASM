.model small
.data
m1 db 10,13,"enter the number $"
n dw ?
res dw ?

.code
mov ax,@data
mov ds,ax

lea dx,m1
mov ah,09
int 21h

mov ah,01
int 21h
mov ah,00
sub ax,0030h
mov n,ax

call fact

mov ah,4ch
int 21h

fact proc
l1 : cmp ax,1
     je exit
     push ax
     dec ax
     call fact
     pop ax
     mul res
     mov res,ax
     ret
exit: mov res,1
      ret
 fact endp

 end
