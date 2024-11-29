section .data
    prompt1 db 'Ingresa el primer numero (0-9): ', 0  ; Mensaje para el primer número
    prompt2 db 'Ingresa el segundo numero (0-9): ', 0 ; Mensaje para el segundo número
    result_msg db 'El resultado es: ', 0              ; Mensaje para mostrar el resultado

section .bss
    num1 resb 1   ; Reservamos un byte para el primer número
    num2 resb 1   ; Reservamos un byte para el segundo número
    result resb 1 ; Reservamos un byte para el resultado

section .text
    global _start   ; El punto de entrada del programa

_start:
    ; Mostrar el mensaje para ingresar el primer número
    mov eax, 4        ; sys_write
    mov ebx, 1        ; salida estándar (stdout)
    mov ecx, prompt1  ; Dirección del mensaje
    mov edx, 30       ; Longitud del mensaje
    int 0x80          ; Llamada al sistema

    ; Leer el primer número desde la entrada estándar (teclado)
    mov eax, 3        ; sys_read
    mov ebx, 0        ; entrada estándar (stdin)
    mov ecx, num1     ; Dirección de la variable para el primer número
    mov edx, 1        ; Leer un byte
    int 0x80          ; Llamada al sistema

    ; Mostrar el mensaje para ingresar el segundo número
    mov eax, 4        ; sys_write
    mov ebx, 1        ; salida estándar (stdout)
    mov ecx, prompt2  ; Dirección del mensaje
    mov edx, 31       ; Longitud del mensaje
    int 0x80          ; Llamada al sistema

    ; Leer el segundo número desde la entrada estándar (teclado)
    mov eax, 3        ; sys_read
    mov ebx, 0        ; entrada estándar (stdin)
    mov ecx, num2     ; Dirección de la variable para el segundo número
    mov edx, 1        ; Leer un byte
    int 0x80          ; Llamada al sistema

    ; Convertir los caracteres ASCII a valores numéricos
    mov al, [num1]    ; Cargar el primer número en AL
    sub al, '0'       ; Convertir de ASCII a entero (restar '0')

    mov bl, [num2]    ; Cargar el segundo número en BL
    sub bl, '0'       ; Convertir de ASCII a entero (restar '0')

    ; Sumar los dos números
    add al, bl        ; AL = AL + BL (resultado de la suma)

    ; Convertir el resultado de vuelta a ASCII
    add al, '0'       ; Convertir el resultado de vuelta a un carácter ASCII

    ; Almacenar el resultado en la variable 'result'
    mov [result], al  ; Guardamos el resultado en 'result'

    ; Mostrar el mensaje "El resultado es: "
    mov eax, 4        ; sys_write
    mov ebx, 1        ; salida estándar (stdout)
    mov ecx, result_msg ; Dirección del mensaje
    mov edx, 16       ; Longitud del mensaje
    int 0x80          ; Llamada al sistema

    ; Mostrar el resultado
    mov eax, 4        ; sys_write
    mov ebx, 1        ; salida estándar (stdout)
    mov ecx, result   ; Dirección del resultado (ya en formato ASCII)
    mov edx, 1        ; Solo un byte (un número)
    int 0x80          ; Llamada al sistema

    ; Finalizar el programa
    mov eax, 1        ; sys_exit
    xor ebx, ebx      ; Código de salida 0
    int 0x80          ; Llamada al sistema
