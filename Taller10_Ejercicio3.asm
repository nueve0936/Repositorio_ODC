section .data
product db 1 ; Inicializa el producto a 1
i db 1 ; Inicializa i a 1
section .text
global _start
_start:
  ; Bucle for (i <= 5)
  CMP byte [i], 6 ; Compara i con 6
  JGE end_loop ; Si i >= 6, termina el bucle
  mov al, [i] ; Cargar el valor de i
  mul byte [product] ; Multiplicar el producto por i
  mov [product], al ; Almacenar el resultado
  inc byte [i] ; Incrementar i
  JMP _start ; Repetir el bucle
  
  end_loop:
; Finaliza el programa
  mov eax, 1 ; Syscall de salida
  xor ebx, ebx
  int 0x80