section .data
num1 db 9              ; Primer número
num2 db 0              ; Segundo número
result db 0            ; Resultado de la suma
msg db "Resultado: ", 0
zeroMsg db "Esto es un cero", 10 ; Mensaje "Esto es un cero"

section .bss
buffer resb 4          ; Buffer para convertir el número a ASCII

section .text
global _start
_start:
  ; Sumar los números
  mov al, [num1]       ; Cargar num1 en al
  add al, [num2]       ; Sumar num2 a al
  mov [result], al     ; Guardar el resultado en result

  ; Verificar si el resultado es 0
  cmp al, 0
  je print_zero        ; Salta si el resultado es 0

  ; Si no es 0, imprimir "Resultado: "
  mov eax, 4           ; Syscall para escribir
  mov ebx, 1           ; Salida estándar
  mov ecx, msg         ; Dirección del mensaje
  mov edx, 11          ; Longitud del mensaje
  int 0x80

  ; Convertir el número en `result` a ASCII
  mov eax, [result]
  add eax, '0'         ; Convertir a carácter ASCII
  mov [buffer], al     ; Guardar en el buffer

  ; Imprimir el número resultado
  mov eax, 4           ; Syscall para escribir
  mov ebx, 1           ; Salida estándar
  mov ecx, buffer      ; Dirección del buffer
  mov edx, 1           ; Longitud del carácter
  int 0x80

  jmp end_program      ; Saltar al final

print_zero:
  ; Imprimir "Esto es un cero"
  mov eax, 4           ; Syscall para escribir
  mov ebx, 1           ; Salida estándar
  mov ecx, zeroMsg     ; Dirección del mensaje
  mov edx, 18          ; Longitud del mensaje
  int 0x80

end_program:
  ; Finaliza el programa
  mov eax, 1           ; Syscall de salida
  xor ebx, ebx         ; Código de salida 0
  int 0x80
