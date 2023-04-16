.model small
.stack
.data
arr dw 01, 02, 03, 04, 05
len dw 05
key dw 06
m1 db 10, 13, "element found$"
m2 db 10, 13, "element not found$"
.code
mov ax, @data
mov ds, ax

mov bx, 00
mov dx, len
mov cx, key

again:  cmp bx, dx
        JG fail

        mov ax, bx
        add ax, dx
        shr ax, 1

        mov si, ax
        add si, si

        cmp cx, arr[si]
        JAE big

        dec ax
        mov dx, ax
        jmp again

big:
JE success
inc ax
mov bx, ax
jmp again

success:
lea dx, m1
jmp disp

fail:
lea dx, m2

disp:
mov ah, 09h
int 21h

mov ah, 4ch
int 21h
end