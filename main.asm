#INCLUDE <P16F628A.INC>

#DEFINE BANK0 bcf STATUS, RP0
#DEFINE BANK1 bsf STATUS, RP0

#DEFINE LED   PORTA, 0
#DEFINE BTN   PORTA, 1

count equ 0x20
      org 0x000
      nop

START BANK1
    clrf PORTA
    clrf PORTB

    movlw B'00000010'
    movwf TRISA

    movlw B'00000000'
    movwf TRISB

    movlw B'10000000'
    movfw OPTION_REG
    movlw B'00000000'
    movfw INTCON

    BANK0

LOOP btfsc BTN
    goto LIGA
    goto DESLIGA

LIGA bsf LED
    goto LOOP

DESLIGA bcf LED
    goto LOOP

    END

