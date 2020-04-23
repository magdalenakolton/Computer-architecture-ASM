default rel
global main
extern printf
extern scanf

section .data
znak db "%c", 0
wczytaj db "%d", 0
wypisz db "%d", 10, 0
zn db 0
a dd 0
b dd 0
przypadek dq _mnozenie, _dodawanie, _def, _odejmowanie,_def,  _dzielenie
blad db "Blad", 10, 0

section .text
main:
sub rsp, 8

mov rdi, znak
mov rsi, zn
xor rax, rax
call scanf wrt ..plt

mov r12d, [zn]
sub r12d, '*'

mov edi, wczytaj
mov esi, a
xor rax, rax
call scanf wrt ..plt

mov edi, wczytaj
mov esi, b
xor rax, rax
call scanf wrt ..plt

cmp r12d, 0
jbe _def

cmp r12d, 5
jae _def

jmp [przypadek+8*r12]

_mnozenie:
mov eax, [a]
mov ebx, [b]
mul ebx

mov edi, wypisz
mov esi, eax
xor rax, rax
call printf wrt ..plt

jmp _exit

_dodawanie:
mov r13d, [a]
add r13d, [b]

mov edi, wypisz 
mov esi, r13d
xor rax, rax
call printf wrt ..plt
jmp _exit

_odejmowanie:
mov r13d, [a]
sub r13d, [b]

mov edi, wypisz
mov esi, r13d
xor rax, rax
call printf wrt ..plt
jmp _exit

_dzielenie:
mov eax, [a]
mov ebx, [b]
xor rdx, rdx
div ebx

mov edi, wypisz
mov esi, eax
xor rax, rax
call printf wrt ..plt
jmp _exit

_def:
mov rdi, blad
xor rax, rax
call printf wrt ..plt

_exit:
add rsp, 8
ret
