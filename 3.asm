; Silvia Daniela Ponce Mendoza
; Lenguaje Ensamblador 
; Ing. En Sistemas Computacionales 
; 
 .model small ;Define el modelo de memoria
 .stack 100h  ;Define el tamaño de la pila

 ;****************************
 .data	;Inicia sección de datos

 mensaje db 'Estimados alumnos', 10,13,'$'
 mensaje1 db 'Bienvenidos al curso Lenguaje ensamblador', 10,13,'$'
 numero db 0

 ;****************************
 .code ;Inicia sección de código
 
 ;Define el punto de entrada del programa
 Principal PROC ; marca el punto de entrada del programa

 mov ax,@data ;Prepare a seccion de datos para imprimir pantalla
 mov ds,ax ;Establece el segmento de datos a la dirección que se encuentra el registro ax



 lea dx,mensaje ;Carga en DX la direccion de la cadena de mensaje
 mov ah,9 ;Establece el valor de 9 al registro ah e imprimir la cadena
 INT 21H ;llama al sistema operativo que muestra una cadena de caracteres en la pantalla

 lea dx,mensaje1 ;Carga en DX la direccion de la cadena de mensaje1
 mov ah,9 ;Establece el valor de 9 al registro ah e imprimir la cadena
 INT 21H ;Salir del programa

 mov ah,0 ;Me permite dar pausa al programa, hasta presionar enter
 int 16h ;llama al sistema operativo que muestra una cadena de caracteres en la pantalla

 CALL salir  ;Llama a la subrutina salir
 Principal ENDP ;finaliza la subrutina Principal
 Salir PROC
 mov ah,4ch ;Funcion de salida
 int 21h  ;Salir del programa

 RET ;Final de la subrutina

 Salir ENDP ;finaliza la subrutina Principal

 end ; Fin del programa

