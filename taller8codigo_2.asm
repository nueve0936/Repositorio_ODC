section .data
    msg db 'Resultado: ', 0  ; Mensaje inicial
    newline db 0xA           ; Nueva línea

section .text
    global _start

_start:

    ; Imprimir el mensaje inicial
    mov eax, 4        ; Syscall para escribir
    mov ebx, 1        ; Usar la salida estándar (pantalla)
    mov ecx, msg      ; Dirección del mensaje
    mov edx, 11       ; Longitud del mensaje
    int 0x80          ; Interrupción para imprimir el mensaje

    ; Imprimir caracteres "I", "D", "B", "4", "2" uno por uno
    mov eax, 4        ; Syscall para escribir
    mov ebx, 1        ; Usar la salida estándar

    ; Imprimir "I"
    mov ecx, 'I'      ; Cargar carácter 'I'
    push ecx          ; Guardar en la pila (temporal)
    mov ecx, esp      ; Dirección del carácter
    mov edx, 1        ; Longitud de 1 carácter
    int 0x80          ; Interrupción para imprimir
    pop ecx           ; Restaurar la pila

    ; Imprimir "D"
    mov ecx, 'D'      ; Cargar carácter 'D'
    push ecx
    mov ecx, esp
    int 0x80
    pop ecx

    ; Imprimir "B"
    mov ecx, 'B'      ; Cargar carácter 'B'
    push ecx
    mov ecx, esp
    int 0x80
    pop ecx

    ; Imprimir "4"
    mov ecx, '4'      ; Cargar carácter '4'
    push ecx
    mov ecx, esp
    int 0x80
    pop ecx

    ; Imprimir "2"
    mov ecx, '2'      ; Cargar carácter '2'
    push ecx
    mov ecx, esp
    int 0x80
    pop ecx

    ; Imprimir nueva línea
    mov eax, 4        ; Syscall para escribir
    mov ecx, newline  ; Dirección de la nueva línea
    mov edx, 1        ; Longitud de 1 carácter
    int 0x80          ; Interrupción para imprimir nueva línea

    ; Terminar el programa
    mov eax, 1        ; Syscall para salir
    xor ebx, ebx      ; Código de salida 0
    int 0x80          ; Interrupción para terminar el programa
