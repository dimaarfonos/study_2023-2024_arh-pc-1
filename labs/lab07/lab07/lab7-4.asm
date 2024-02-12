%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите a: ',0h
msg3 db 'f(x) = ',0h

section .bss
x resb 10
a resb 10

section .text
global _start
_start:
mov eax,msg1
call sprint
mov ecx,x
mov edx,10
call sread
mov eax,x
;----------
call atoi
mov [x],eax
;-----------

mov eax,msg2
call sprint
mov ecx,a
mov edx,10
call sread
mov eax,a ;
call atoi
mov [a],eax ;
;----------
mov ecx,[a]
cmp ecx,[x] ;x>a
jl check_a ;
mov ebx,15
mov ecx,ebx
jmp _end
check_a:
mov ecx,[x]
sub ecx,[a]
mov eax,ecx
mov ebx,2
mul ebx
mov ecx,eax
;----------
_end:
mov eax,msg3 ;
call sprint ;
mov eax,ecx ;
call iprintLF;
call quit ;
