section .data
numbers db 1, 2, 3, 4, 5, -1 ; Lista de números (termina en -1)
sum db 0 ; Inicializa la suma

section .text
global _start

_start:
  ; Cargar la dirección del primer número
  lea si, [numbers]
  
do_while_loop:
  mov al, [si] ; Cargar el número actual
  add byte [sum], al ; Sumar el número al total
  inc si ; Mover al siguiente número
  cmp al, -1 ; Compara si el número es -1
  js do_while_loop ; Si es negativo, vuelve al inicio del bucle
  ; Finaliza el programa
  mov eax, 1 ; Syscall de salida
  xor ebx, ebx ; Código de salida 0
  int 0x80