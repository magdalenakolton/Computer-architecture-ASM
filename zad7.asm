default rel
global main
extern scanf
extern printf

section .data
n dd 0
przypadek dq _pon, _wt, _sr, _czw, _pt, _sb, _nd, _default
wpisz db "%d", 0
podaj db "Podaj liczbe: ", 10, 0
poniedz db "Poniedziałek", 10, 0
wtorek db "Wtorek", 10, 0
sroda db "Środa", 10, 0
czwartek db "Czwartek", 10, 0
piatek db "Piatek", 10, 0
sobota db "Sobota", 10, 0
niedziela db "Niedziela", 10, 0
nic db "Blad", 10, 0

section .text
main:
sub rsp, 8

mov rdi, podaj
xor rax, rax
call printf wrt ..plt

mov rdi, wpisz
mov rsi, n
xor rax, rax
call scanf wrt ..plt

xor r12d, r12d
mov r12d, [n]

cmp r12d, 1
jb _default

cmp r12d, 7
ja _default

jmp [przypadek + 8*r12d-8]

_pon:
mov rdi, poniedz
xor rax, rax
call printf wrt ..plt
jmp _koniec

_wt:
mov rdi, wtorek
xor rax, rax
call printf wrt ..plt
jmp _koniec

_sr:
mov rdi, sroda
xor rax, rax
call printf wrt ..plt
jmp _koniec

_czw:
mov rdi, czwartek
xor rax, rax
call printf wrt ..plt
jmp _koniec

_pt:
mov rdi, piatek
xor rax, rax
call printf wrt ..plt
jmp _koniec

_sb:
mov rdi, sobota
xor rax, rax
call printf wrt ..plt
jmp _koniec

_nd: 
mov rdi, niedziela
xor rax, rax
call printf wrt ..plt
jmp _koniec

_default:
mov rdi, nic
xor rax, rax
call printf wrt ..plt

_koniec:
add rsp, 8
ret

