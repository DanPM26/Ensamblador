;Nombre: Silvia Daniela Ponce Mendoza
;Fecha : 19 de enero 2024

;;;;;;;;;;;;;;;;

.STACK 100h ;Define el tama�o de la pila
;;;;;;;;;;;;;;;;;
.DATA ;Inicia secci�n de datos
nombre db 'VISUALIZAR MENSAJE.txt',0
mensaje db 'GRACIAS POR SU ATENCION...:)'
handleprueba dw ? ; Definici�n de la variable, handleprueba,que tiene como valor indefinido
;;;;;;;;;;;;;;;;;
.CODE ; Inicio del c�digo 
MOV AX,@DATA ;Prepara la seccion de datos para imprimir pantalla
MOV DS,AX  ;Establece el segmento de datos a la direcci�n que se encuentra el registro ax

;-Creacion del archivo
MOV AH, 3ch ;Funci�n para crear un archivo
MOV CX, 00h ;Establece el modo de creaci�n del archivo
MOV DX, OFFSET nombre   ;Carga la direcci�n del nombre en el registro dx
INT 21h ;Crea el archivo

;-Apertura del archivo patra Lectura/Escritura
MOV AH, 3dh ;Funci�n para abrir un archivo
MOV AL, 02h ;Funci�n para abrir la lectura y escritura
MOV DX, OFFSET nombre  ;Carga la direcci�n del nombre en el registro dx

INT 21h ;Abre el archivo
MOV handleprueba,AX ;mueve el valor que se encuentra en el registro AX al registro handleprueba.

;-Escritura del mensaje en el fichero
MOV AH, 40h ;Establece el c�digo de funci�n para escribir en un archivo
MOV BX, handleprueba ;Carga el descriptor de archivo del archivo abierto en el registro BX
MOV CX, 30d ; Carga 30 bytes en mensaje
MOV DX, OFFSET mensaje ;carga la direcci�n de la cadena de caracteres mensaje en el registro DX
INT 21h ;Escribe en el archivo

;-Cerrar archivo
MOV AH, 3eh ; Funci�n para cerrar el archivo
MOV BX, handleprueba ;carga el descriptor de archivo del archivo abierto en el registro BX
INT 21h ;Cierra el archivo

EXIT:
MOV AX,4c00h ;Funci�n para finalizar el programa
INT 21h ;Cierra el archivo
END
