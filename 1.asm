.model small ;Define el modelo de memoria

.stack 100h ;Define el tamaño de la pila

;****************************

.data ;Inicia sección de datos

;Definición de las variables 
mensaje db 'Estimados alumnos', 10,13,'$'
mensaje1 db 'Bienvenidos al curso Lenguaje ensamblador', 10,13,'$'
numero db 0 ;Define la variable número con valor iniciar de 0 byte

;****************************

.code ; Inicia sección de código

; Define el punto de entrada del programa
Principal:



; Carga la dirección de la sección de datos en el registro ax
mov ax,@data ;Prepara la seccion de datos para imprimir pantalla


mov ds,ax ;Establece el segmento de datos a la dirección que se encuentra el registro ax

lea dx,mensaje ;Carga en DX la dirección de la cadena de mensaje
mov ah,9 ; Establece el código de función para imprimir una cadena de caracteres
INT 21H ; llama a la interrupción 0x21hr del BIOS, que imprime la cadena de registro dx

lea dx,mensaje1 ; Carga la variable de mensaje1 en el registro dx
mov ah,9 ; Establece el código de función para imprimir una cadena de caracteres
INT 21H ; llama a la interrupción 0x21hr del BIOS, que imprime la cadena de registro dx

mov ah,0 ;Me permite dar pausa al programa, hasta presionar enter
int 16h ;llama a la interrupción 0x16h del BIOS, que espera a que el usuario presione una tecla.


mov ah,4ch ;Funcion de salida
int 21h ;Finalización del programa
end Principal

end
