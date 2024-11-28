section .data
num db 5 ; Número a verificar
result_even db "Par", 0
result_odd db "Impar", 0

section .text
global _start

_start:

  mov al, [num] ; Cargar el número
  test al, 1 ; Realiza un AND con 1 para verificar si es par o impar
  jz even ; Si el resultado es 0, es par (bit menos significativo 0)
odd:
; Imprimir "Impar"
  mov eax, 4 ; Syscall de escritura
  mov ebx, 1 ; Salida estándar
  mov ecx, result_odd ; Dirección del mensaje
  mov edx, 5 ; Longitud del mensaje
  int 0x80
  jmp exit_program
even:
  ; Imprimir "Par"
  mov eax, 4 ; Syscall de escritura
  mov ebx, 1 ; Salida estándar
  mov ecx, result_even ; Dirección del mensaje
  mov edx, 4 ; Longitud del mensaje
  int 0x80
exit_program:
; Finaliza el programa
mov eax, 1 ; Syscall de salida
xor ebx, ebx ; Código de salida 0
int 0x80