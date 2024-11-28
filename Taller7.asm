section .data
    num1 db 3
    num2 db 10
    result db 0        
    msg db 'Resultado: ',0

section .bss
    buffer resb 4     

section .text
global _start

_start:
    
    mov al, [num1]  ;Direccionamiento directo.
    add al, [num2]
    mov [result], al   

                              ; Se asegura de que el resulrado de la suma
    movzx eax, byte [result]  ; se copie a un registro mas grande sin alterar el valor.
    add eax, '48'  ;Direccionamiento inmediato.
    mov [buffer], al  

    
    mov eax, 4         
    mov ebx, 1         
    mov ecx, msg       
    mov edx, 11        
    int 0x80

   
    mov eax, 4        
    mov ebx, 1        
    mov ecx, buffer   
    mov edx, 1    
    int 0x80

    
    mov eax, 1        
    xor ebx, ebx      
    int 0x80
