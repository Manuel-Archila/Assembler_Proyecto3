/*
 * Autores: Daniel Gonzalez 20293, Alejandro Archila 161250
 * Modificacion: 01/06/2021
 * Archivo: subRutinasD.s
 * Curso: CC3054 Organizacion de computadoras y assembler.
 * Descripcion: El archivo contiene diferentes subrutinas. Tiene una subrutina que
 *              inicializa todos los pines del GPIO para poder escribir o leer de ellos;
 *              tiene subrutinas que encienden LEDs del 7 segmentos para mostrar las letras
 *              necesarias del porgrama; tiene la subrutina que muestra la secuencia de letras
 *              en reversa.
 */


.text
.align 2

.global reversa
reversa:

    push {lr}

    SWITCH .req r5
    ldr SWITCH, =switchPort

    loopLetras:
        
        //------------Letra F------------
        bl funcF

        ldr r0,[SWITCH]
        bl digitalRead
        mov r7,r0

        cmp r7,#1
        bne fin

        ldr	r0, =delayMs
	    ldr	r0, [r0]
	    bl	delay	
        
        bl reset

        mov r0, #250
	    bl	delay

        
        //------------Letra E------------

        bl funcE

        ldr r0,[SWITCH]
        bl digitalRead
        mov r7,r0

        cmp r7,#1
        bne fin

        ldr	r0, =delayMs
	    ldr	r0, [r0]
	    bl	delay	
        
        bl reset

        mov r0, #250
	    bl	delay


        //------------Letra D------------

        bl funcD

        ldr r0,[SWITCH]
        bl digitalRead
        mov r7,r0

        cmp r7,#1
        bne fin

        ldr	r0, =delayMs
	    ldr	r0, [r0]
	    bl	delay	
        
        bl reset

        mov r0, #250
	    bl	delay


        //------------Letra C------------

        bl funcC

        ldr r0,[SWITCH]
        bl digitalRead
        mov r7,r0

        cmp r7,#1
        bne fin

        ldr	r0, =delayMs
	    ldr	r0, [r0]
	    bl	delay	
        
        bl reset

        mov r0, #250
	    bl	delay


        //------------Letra B------------

        bl funcB

        ldr r0,[SWITCH]
        bl digitalRead
        mov r7,r0

        cmp r7,#1
        bne fin

        ldr	r0, =delayMs
	    ldr	r0, [r0]
	    bl	delay	
        
        bl reset

        mov r0, #250
	    bl	delay
        

        //------------Letra A------------

        bl funcA

        ldr r0,[SWITCH]
        bl digitalRead
        mov r7,r0

        cmp r7,#1
        bne fin

        ldr	r0, =delayMs
	    ldr	r0, [r0]
	    bl	delay	
        
        bl reset

        mov r0, #250
	    bl	delay

        b loopLetras

    fin:
    .unreq SWITCH

    bl reset
    mov r0, #500
	bl	delay

    pop {pc}



@funcA: Subrutina que permite mostrar en LED de 7 segmentos una A.
.global funcA
funcA:
    push {lr}

    //Se encienden los leds correspondientes a la A.

    ldr	r0, =pina				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pinb				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pinc				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pine				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pinf				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =ping				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite
    
    pop {pc}


@funcB: Subrutina que permite mostrar en LED de 7 segmentos una B.
.global funcB
funcB:
    push {lr}

    //Se encienden los leds correspondientes a la B.

    ldr	r0, =pinc				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pind				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pine				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pinf				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =ping				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite
    
    pop {pc}


@funcB: Subrutina que permite mostrar en LED de 7 segmentos una C.
.global funcC
funcC:
    push {lr}

    //Se encienden los leds correspondientes a la B.

    ldr	r0, =pina				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pind				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pine				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite

    ldr	r0, =pinf				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #0
	bl 	digitalWrite
    
    pop {pc}


@reset: Hace que se apaguen todas las luces del LED de 7 segmentos. 
.global reset
reset:
    push {lr}

    //Se apagan todas las luces por medio de digitalWrite.
    //Se usa logica inversa para apagarlas, por lo que se usa #1 para la subrutina.

    ldr	r0, =pina				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite

    ldr	r0, =pinb				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite

    ldr	r0, =pinc				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite

    ldr	r0, =pind				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite

    ldr	r0, =pine				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite

    ldr	r0, =pinf				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite

    ldr	r0, =ping				// carga dirección de pin
	ldr	r0, [r0]				// operaciones anteriores borraron valor de pin en r0
	mov	r1, #1
	bl 	digitalWrite
    
    pop {pc}


@init: Subrutina que permite inicializar todos los registros.
.global init
init:
    push {lr}

    //Se preparan los pines del GPIO. Las luces del LED se marcan para escribir en ellas
    //y se marca el switch como lectura.

    //PinA
	ldr	r0, =pina				// coloca el #pin wiringpi a r0
	ldr	r0, [r0]
	mov	r1, #1  				// lo configura como salida, r1 = 1
	bl	pinMode					// llama funcion wiringpi para configurar


    //PinB
	ldr	r0, =pinb				// coloca el #pin wiringpi a r0
	ldr	r0, [r0]
	mov	r1, #1      			// lo configura como salida, r1 = 1
	bl	pinMode					// llama funcion wiringpi para configurar


    //PinC
	ldr	r0, =pinc				// coloca el #pin wiringpi a r0
	ldr	r0, [r0]
	mov	r1, #1  				// lo configura como salida, r1 = 1
	bl	pinMode					// llama funcion wiringpi para configurar


    //PinD
	ldr	r0, =pind				// coloca el #pin wiringpi a r0
	ldr	r0, [r0]
	mov	r1, #1  				// lo configura como salida, r1 = 1
	bl	pinMode					// llama funcion wiringpi para configurar


    //PinE
	ldr	r0, =pine				// coloca el #pin wiringpi a r0
	ldr	r0, [r0]
	mov	r1, #1  				// lo configura como salida, r1 = 1
	bl	pinMode					// llama funcion wiringpi para configurar


    //PinF
	ldr	r0, =pinf				// coloca el #pin wiringpi a r0
	ldr	r0, [r0]
	mov	r1, #1      			// lo configura como salida, r1 = 1
	bl	pinMode					// llama funcion wiringpi para configurar

    //PinG
	ldr	r0, =ping				// coloca el #pin wiringpi a r0
	ldr	r0, [r0]
	mov	r1, #1			        // lo configura como salida, r1 = 1
	bl	pinMode

    ldr r0, =switchPort
    ldr r0, [r0]
    mov r1, #0	
    bl pinMode	

    pop {lr}
