default rel
global main
extern printf
extern scanf

section .data
format db "%d"
tab TIMES 10 dd 0
spacja db " ", 0
section .text
main:
sub rsp, 8

xor rbx, rbx
mov r12, tab

_petla:
cmp rbx, 10
je _wysw

mov rdi, format
mov rsi, r12
xor rax, rax
call scanf wrt ..plt

inc rbx
add r12, 4

jmp _petla

_wysw:
xor r13, r13

_wyswietlanie:
cmp r13, 10
je _koniec

mov rdi, format
mov rsi, [tab+4*r13]
xor rax, rax
call printf wrt ..plt

mov rdi, spacja
xor rax, rax
call printf wrt ..plt
inc r13

jmp _wyswietlanie

_koniec:
add rsp,8
ret


