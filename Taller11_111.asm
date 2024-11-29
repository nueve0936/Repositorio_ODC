section .data
    mensaje db "El resultado de la suma es: ", 0  ; Cadena que se mostrará antes del resultado
    newline db 10, 0                         ; Nueva línea para la salida

section .bss
    buffer_num resb 4                            ; Reservar espacio para convertir números a caracteres

section .text
    global _start

; Macro para definir tres valores constantes
%macro DEFINE_VALUES 3
    valor1 db %1         ; Primer número
    valor2 db %2         ; Segundo número
    valor3 db %3         ; Tercer número
%endmacro

; Macro para imprimir una cadena de texto
%macro PRINT_STRING 1
    mov eax, 4           ; Llamada al sistema 'write'
    mov ebx, 1           ; Descriptor de archivo para STDOUT (salida estándar)
    mov ecx, %1          ; Dirección de la cadena a imprimir
    mov edx, 32          ; Longitud del texto a mostrar
    int 0x80             ; Llamada al sistema
%endmacro

; Macro para imprimir un número
%macro PPRINT_NUMBER 1
  mov rax, 1%          ; Cargar el número en RAX (aquí hay un error, debería ser `mov rax, %1`)
  mov ecx, buffer      ; Establecer el buffer donde almacenaremos los caracteres del número
  mov ebx, 10          ; Divisor para convertir el número a base 10
  
.next_digit:
    xor edx, edx       ; Limpiar el valor de edx
    div ebx            ; Dividir el número (en RAX) por 10, el residuo se guarda en DL
    add dl, '0'        ; Convertir el residuo a un carácter ASCII
    dec ecx            ; Mover al siguiente lugar en el buffer
    mov [ecx], dl      ; Guardar el carácter en el buffer
    test eax, eax      ; Verificar si el cociente es 0
    jnz .next_digit    ; Si no es 0, continuar dividiendo
    
    ; Imprimir el número almacenado en el buffer
    mov eax, 4         ; Llamada al sistema 'write'
    mov ebx, 1         ; Descriptor de archivo para STDOUT
    mov ecx, buffer    ; Dirección del buffer
    mov edx, buffer + 4; Longitud del número a imprimir
    sub ecx, edx       ; Calcular la longitud del número
    int 0x80           ; Llamada al sistema
%endmacro

; Macro para realizar la suma de los tres valores y mostrar el resultado
%macro PRINT_SUM 0
    mov al, [valor1]    ; Cargar el primer valor en AL
    add al, [valor2]    ; Sumar el segundo valor
    add al, [valor3]    ; Sumar el tercer valor
    movzx eax, al       ; Extender AL a EAX (convertir a 32 bits)
    
    PRINT_NUMBER eax    ; Imprimir el resultado de la suma
    PRINT_STRING newline ; Imprimir una nueva línea
%endmacro

; Definir los valores a sumar: 3, 5 y 7
DEFINE_VALUES 3, 5, 7

_start:
    ; Mostrar el mensaje introductorio
    PRINT_STRING mensaje
    
    ; Mostrar el resultado de la suma
    PRINT_SUM
    
    ; Salir del programa
    mov eax, 1          ; Llamada al sistema 'exit'
    mov ebx, 0          ; Código de salida (0)
    int 0x80            ; Llamada al sistema
