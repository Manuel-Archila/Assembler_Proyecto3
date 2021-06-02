
.data
.align 2
ErrMsg:	 .asciz	"Setup didn't work... Aborting...\n"
.global switchPort
    switchPort: .int 10
.global pina
    pina:	.int 22  
.global pinb
    pinb: .int 27
.global pinc
    pinc: .int 14
.global pind
    pind: .int 16
.global pine
    pine: .int 12
.global pinf
    pinf: .int 17
.global ping
    ping: .int 18
.global delayMs
delayMs: .int	450


.text
.global main
main:
    push {lr}

    bl 	wiringPiSetupGpio	// Inicializar usando pines del conector
	mov	r1,#-1					// -1 representa un código de error
	cmp	r0, r1					// verifica si se retornó cod error en r0
	bne	init					// NO error, entonces iniciar programa
	ldr	r0, =ErrMsg				// SI error,
	bl	printf					// imprimir mensaje y
	b	done

    bl init



    pop {pc}