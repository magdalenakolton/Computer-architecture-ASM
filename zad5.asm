default rel
global main
extern printf
extern scanf

section .data
podaj db "Podaj 10 liczb: ", 10, 0
wprowadz db "%d", 0
wypisz db "%d", 10, 0
tab TIMES 100 dd 0

section .text
main:
sub rsp, 8

mov rdi, podaj
xor rax, rax
call printf wrt ..plt

xor r12d, r12d
mov r14d, tab

_wczyt:
cmp r12d, 10
je _zeruj

mov rdi, wprowadz
mov esi, r14d
xor rax, rax
call scanf wrt ..plt

add r14d, 4
inc r12d
jmp _wczyt

_zeruj: 
xor r12d, r12d
jmp _przejscie

_przejscie:
cmp r12d, 10
je _koniec 

mov eax, [tab+4*r12d]
mov ebx, 2
xor rdx, rdx
div ebx

cmp edx, 0
je _parzysta

inc r12d
jmp _przejscie

_parzysta: 
mov rdi, wypisz
mov esi, [tab+4*r12d]
xor rax, rax
call printf wrt ..plt

inc r12d
jmp _przejscie

_koniec:
add rsp, 8
ret
