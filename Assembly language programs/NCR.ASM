.model small
.data
m1 db 10,13,"Enter N : $"
m2  db 10,13,"Enter R : $"
m3 db 10,13,"The ncr is : $"
m4 db 10,13,"The ncr value is $"
n dw ?
r dw ?
res dw 00

.code
mov ax,@data
mov ds,ax

lea dx,m1
mov ah,09
int 21h

mov ah,01
int 21h
mov ah,00
sub al,30h
mov n,ax

lea dx,m2
mov ah,09
int 21h

mov ah,01
int 21h
mov ah,00
sub al,30h
mov r,ax

mov ax,n
mov bx,r
call rencr

lea dx,m4
mov ah,09
int 21h


mov cx,res
add cx,3030h
mov dx,cx
mov ah,02
int 21h

mov ah,4ch
int 21h

rencr proc
cmp ax,bx
je resone
cmp bx,0
je resone
cmp bx,1
je resnum

dec ax
cmp ax,bx
je resn1
push ax
push bx
call rencr

pop bx
pop ax

dec bx
push ax
push bx
 call rencr
 pop bx
 pop ax
 ret

resone:add res,1
ret
resn1:inc res
resnum: add res,ax
ret
rencr endp




end
