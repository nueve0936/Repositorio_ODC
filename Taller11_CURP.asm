section .data
    ; Definimos la CURP, por ejemplo:
    curp db "AONN050427HBCYVNA3", 0  

section .text
    global _start

_start:
    ; Acceso y manipulación de la CURP

    ; Cambiamos el año de nacimiento
    mov byte [curp + 4], '0'  ; Año (primer dígito)
    mov byte [curp + 5], '2'  ; Año (segundo dígito)

    ; Cambiamos el sexo a femenino
    mov byte [curp + 10], 'M' ; Sexo

    ; Cambiamos la entidad de nacimiento
    mov byte [curp + 11], 'J' ; Primera letra de la entidad
    mov byte [curp + 12], 'A' ; Segunda letra de la entidad

    ; Imprimimos la CURP después de los cambios
    mov eax, 4                ; syscall write
    mov ebx, 1                ; Descriptor de salida (1 = STDOUT)
    mov ecx, curp             ; Dirección de la CURP
    mov edx, 18               ; Longitud de la CURP
    int 0x80                  ; Interrupción del sistema

    ; Finalizamos el programa
    mov eax, 1                ; syscall exit
    xor ebx, ebx              ; Código de salida 0
    int 0x80                  ; Interrupción del sistema


