section .data
count db 10 ; Inicializa count en 10

section .text
global _start

_start:
  ; Bucle for (count >= 1)
  CMP byte [count], 0 ; Compara count con 0
  JGE print_count ; Si count >= 1, imprime el número

end_loop:
  ; Finaliza el programa
  mov eax, 1 ; Syscall de salida
  xor ebx, ebx ; Código de salida 0
  int 0x80
  
print_count:
  ; Imprimir el valor de count
  ; [Código para imprimir count aquí]
  dec byte [count] ; Decrementa count
  JMP _start ; Repite el bucle