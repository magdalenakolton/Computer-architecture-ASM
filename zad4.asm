default rel
global main
extern printf
extern scanf

section .data
a db 0
podaj db "Podaj ciag znakow: ", 10, 0
wczytaj db "%s", 0
wyswietl db "%d", 0

section .text
main:
sub rsp,8

mov rdi, podaj
xor rax, rax
call printf wrt ..plt

mov rdi, wczytaj
mov rsi, a
xor rax, rax
call scanf wrt ..plt

xor r12d, r12d
xor r13d, r13d

_petla:
cmp byte [a + r12d], 0
je _koniec

cmp byte [a + r12d], 'a'
je _dodaj

inc r12d
jmp _petla

_dodaj:
inc r13d
inc r12d
jmp _petla

_koniec:
mov rdi, wyswietl
mov esi, r13d
xor rax, rax
call printf wrt ..plt
add rsp,8
ret

