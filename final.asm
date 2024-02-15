.model small
.stack 100h

.data
s db 10 dup(?) ; Define una variable llamada 's'
nombre_apellido_msg db 'Ingrese nombre y apellido: $'
cuenta_msg db 'Ingrese número de cuenta (5 dígitos): $'
credito_msg db 'Ingrese crédito disponible: $'
actualizar_credito_msg db 'Ingrese el número de cuenta del cliente a actualizar: $'
confirmar_actualizacion_msg db '¿Está seguro que desea actualizar el crédito? (S/N): $'
credito_actualizado_positivo_msg db 'Crédito actualizado correctamente (positivo).$'
credito_actualizado_negativo_msg db 'Crédito actualizado correctamente (negativo).$'
cliente_size equ 25 ; Tamaño de la información de cada cliente
cliente_data db 10 * cliente_size dup(?) ; Arreglo para almacenar datos de clientes


.code
start:
	mov ax, @data
	mov ds, ax

	call agregar_cliente
	call ingresar_clientes

	; Llama a la rutina para actualizar el crédito de un cliente

	mov ax, 4c00h
	int 21h

; Rutina para ingresar los datos de un solo cliente
agregar_cliente:
	; Solicitar nombre y apellido
	mov ah, 09h
	lea dx, nombre_apellido_msg
	int 21h

	; Leer nombre y apellido
	mov ah, 0ah
	lea dx, s
	int 21h

	; Solicitar número de cuenta
	mov ah, 09h
	lea dx, cuenta_msg
	int 21h

	; Leer número de cuenta
	mov ah, 0ah
	lea dx, s+10 ; Desplazamiento para almacenar número de cuenta después de nombre y apellido
	int 21h

	; Solicitar crédito disponible
	mov ah, 09h
	lea dx, credito_msg
	int 21h

	; Leer crédito disponible
	mov ah, 0ah
	lea dx, s+15 ; Desplazamiento para almacenar crédito disponible después del número de cuenta
	int 21h

	ret

; Rutina para ingresar los datos de los clientes
ingresar_clientes:
	mov cx, 10   ; Número de clientes a ingresar
	mov si, offset cliente_data ; Puntero al inicio del arreglo de datos de clientes

ingresar_cliente_loop:
	; Solicitar nombre y apellido
	mov ah, 09h
	lea dx, nombre_apellido_msg
	int 21h

	; Leer nombre y apellido
	mov ah, 0ah
	lea dx, si
	int 21h

	; Solicitar número de cuenta
	mov ah, 09h
	lea dx, cuenta_msg
	int 21h

	; Leer número de cuenta
	mov ah, 0ah
	lea dx, si+10 ; Desplazamiento para almacenar número de cuenta después de nombre y apellido
	int 21h

	; Solicitar crédito disponible
	mov ah, 09h
	lea dx, credito_msg
	int 21h

	; Leer crédito disponible
	mov ah, 0ah
	lea dx, si+15 ; Desplazamiento para almacenar crédito disponible después del número de cuenta
	int 21h

	; Actualizar puntero al siguiente cliente
	add si, cliente_size

	; Decrementar contador de clientes
	dec cx
	jnz ingresar_cliente_loop

	ret

; Rutina para actualizar el crédito de un cliente
actualizar_credito:
	mov ah, 09h
	lea dx, actualizar_credito_msg
	int 21h

	; Leer número de cuenta
	mov ah, 01h
	int 21h

	; Convertir número de cuenta a índice de cliente
	sub al, '0'  ; Convertir de ASCII a número
	mov bl, al
	mov bh, 0
	mov cl, cliente_size
	mul cl
	mov si, offset cliente_data
	add si, ax

	; Mostrar datos del cliente
	mov ah, 09h
	lea dx, s

