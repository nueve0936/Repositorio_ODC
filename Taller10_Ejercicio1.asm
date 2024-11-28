section .data
sum db 0 ; Inicializa sum a 0
count db 1 ; Inicializa count a 1

section .text
global _start

_start:
  ; Bucle while (count <= 10)
  CMP byte [count], 10 ; Compara count con 10
  JG end_loop ; Salta al final si count > 10

  ADD byte [sum], [count] ; Suma count a sum
  INC byte [count] ; Incrementa count
  JMP _start ; Salta al principio del bucle

end_loop:
; Finaliza el programa
mov eax, 1 ; Syscall de salida
xor ebx, ebx ; Código de salida 0
int 0x80