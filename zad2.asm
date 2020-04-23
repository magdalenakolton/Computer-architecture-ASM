default rel
global main
extern printf
extern scanf

section .data
n dd 0
tekst db "Ile liczb zostanie wprowadzonych?", 10, 0
wprowadz db "Wprowadz liczby: ", 10, 0
format db "%d", 0
tab TIMES 100 dd 0
spacja db " ", 0

section .text
main:
sub rsp, 8

mov rdi, tekst
xor rax, rax
call printf wrt ..plt

mov rdi, format
mov esi, n
xor rax, rax
call scanf wrt ..plt

mov rdi, wprowadz
xor rax, rax
call printf wrt ..plt

mov r12d, tab
mov r13d, 0

_wpisywanie:
cmp r13d, [n]
je _wyp

mov rdi, format
mov esi, r12d
xor rax, rax
call scanf wrt ..plt

inc r13d
add r12d, 4
jmp _wpisywanie

_wyp:
mov r13d, 0
mov r15d, 0

_najmniejsza:
mov r15d, [tab+4*r13d]
inc r13d

_wypisywanie:
cmp r13d, [n]
je _koniec

cmp r15d, [tab+4*r13d]
ja _najmniejsza
inc r13d
jmp _wypisywanie

_koniec:
mov rdi, format
mov esi, r15d
xor rax, rax
call printf wrt ..plt
add rsp,8
ret


