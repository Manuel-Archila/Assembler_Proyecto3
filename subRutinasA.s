/*
 * Autores: Daniel Gonzalez 20293, Alejandro Archila 161250
 * Modificacion: 01/06/2021
 * Archivo: subRutinasA.s
 * Curso: CC3054 Organizacion de computadoras y assembler.
 * Descripcion: El archivo contiene diferentes subrutinas. Tiene subrutinas que encienden LEDs del 7 segmentos
 *              para mostrar las letras necesarias del porgrama (D, E, F); tiene la subrutina que muestra la 
 *              secuencia de letras en orden.
 */


.text
.align 2


//Subrutina que enciende la letra D
.global funcD
funcD:
	push {lr}
	//Activando el segmento b en el display
	ldr r0,=pinb
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento c en el display
	ldr r0,=pinc
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento d en el display
	ldr r0,=pind
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento e en el display
	ldr r0,=pine
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento d en el display
	ldr r0,=ping
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	pop {pc}

//Subrutina que enciende la letra E
.global funcE
funcE:
	push {lr}

	//Activando el segmento a en el display
	ldr r0,=pina
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento d en el display
	ldr r0,=pind
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento e en el display
	ldr r0,=pine
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento f en el display
	ldr r0,=pinf
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento g en el display
	ldr r0,=ping
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	pop {pc}


//Subrutina que enciende la letra F
.global funcF
funcF:
	push {lr}

	//Activando el segmento a del display
	ldr r0,=pina
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento e del display
	ldr r0,=pine
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento f del dispaly
	ldr r0,=pinf
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	//Activando el segmento g del display
	ldr r0,=ping
	ldr r0,[r0]
	mov r1,#0
	bl digitalWrite

	pop {pc}


//Subrutina que muestra las letras en orden
.global norm
norm:
	push {lr}
	//Cargar el switch
	SWITCH .req r5
	ldr SWITCH,=switchPort
loopMostrar:
	//--------------Letra A---------------
	bl funcA
	//Verificar el valor 
	ldr r0,[SWITCH]
	bl digitalRead
	mov r7,r0

	//Verificar el valor del switch
	cmp r7,#1
	beq fin

	//Cargar delay
	ldr r0,=delayMs
	ldr r0,[r0]
	bl delay

	//Apagar todas las luces del dispaly
	bl reset

	mov r0,#250
	bl delay

	//--------------Letra B---------------
	bl funcA
