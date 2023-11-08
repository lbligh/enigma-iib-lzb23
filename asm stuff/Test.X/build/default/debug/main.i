# 1 "main.asm"
# 1 "<built-in>" 1
# 1 "main.asm" 2
        processor p16f884
        radix dec

        include p16f884.inc

; The recognition of labels and registers is not always good, therefore
; be treated cautiously the results.

        CONFIG FOSC = HS
        CONFIG WDTE = OFF
        CONFIG PWRTE = OFF
        CONFIG MCLRE = ON
        CONFIG CP = OFF
        CONFIG CPD = OFF
        CONFIG BOREN = OFF
        CONFIG IESO = OFF
        CONFIG FCMEN = ON
        CONFIG LVP = OFF
        CONFIG DEBUG = OFF
        CONFIG BOR4V = BOR40V
        CONFIG WRT = OFF

        __idlocs 0x0A2A

;===============================================================================
; CODE area

        ; code

        org __CODE_START ; address: 0x0000

vector_reset: ; address: 0x0000

        goto label_001

label_001: ; address: 0x0001

        bcf STATUS, RP0 ; reg: 0x003, bit: 5
        bcf STATUS, RP1 ; reg: 0x003, bit: 6 - rp0 and rp1 are 0 select bank 0 (ports a,b,c,e)
        clrf PORTA ; reg: 0x005 - clear RA0-RA7

pin_modes: ; address: 0x0004

        bsf STATUS, RP0 ; reg: 0x003, bit: 5
        bsf STATUS, RP1 ; reg: 0x003, bit: 6 - rp0 and rp1 are 1 select bank 3 (for ansel)
        clrf ANSEL ; reg: 0x188 - set PORTA as digital IO
        bcf STATUS, RP1 ; reg: 0x003, bit: 6
        movlw 0xff
        movwf TRISA ; reg: 0x085 - SET PORTA as all inputs
        bcf STATUS, RP0 ; reg: 0x003, bit: 5
        bcf STATUS, RP0 ; reg: 0x003, bit: 5
        bcf STATUS, RP1 ; reg: 0x003, bit: 6 - rp0 and rp1 are 0 select bank 0 (ports a,b,c,e)
        clrf PORTB ; reg: 0x006 - clear RB0-RB7
        bsf STATUS, RP1 ; reg: 0x003, bit: 6
        bsf STATUS, RP0 ; reg: 0x003, bit: 5 - rp0 and rp1 are 0 select bank 0 (ports a,b,c,e)
        clrf ANSELH ; reg: 0x189 - clear anselh - set IO bank b to digital
        bcf STATUS, RP1 ; reg: 0x003, bit: 6
        bsf STATUS, RP0 ; reg: 0x003, bit: 5 - rp1 0 rp0 1 - bank 2
        movlw 0xff
        movwf TRISB ; reg: 0x086 - set IO bank B to inputs
        bcf STATUS, RP0 ; reg: 0x003, bit: 5 - rp1 0 rp0 0 - bank 0
        clrf PORTC ; reg: 0x007
        bsf STATUS, RP0 ; reg: 0x003, bit: 5 - bank 2
        movlw 0x00
        movwf TRISC ; reg: 0x087 - set IO C as outputs
        bcf STATUS, RP0 ; reg: 0x003, bit: 5 - bank 0
        clrf PORTD ; reg: 0x008
        bsf STATUS, RP0 ; reg: 0x003, bit: 5 - bank 2
        movlw 0x00
        movwf TRISD ; reg: 0x088 - set io d as outputs
        bcf STATUS, RP0 ; reg: 0x003, bit: 5 - bank 0
        bsf TMR1H, 0x6 ; reg: 0x00f
        bsf TMR1H, 0x5 ; reg: 0x00f
        bcf TMR1H, 0x4 ; reg: 0x00f
        bcf TMR1H, 0x0 ; reg: 0x00f
        bcf STATUS, RP0 ; reg: 0x003, bit: 5
        btfsc PORTA, RA3 ; reg: 0x005, bit: 3
        goto label_003
        goto label_014

label_003: ; address: 0x0028

        call function_011
        bsf STATUS, RP0 ; reg: 0x003, bit: 5
        bcf TMR0, 0x5 ; reg: 0x001
        bcf STATUS, RP0 ; reg: 0x003, bit: 5
        movlw 0x01
        movwf 0x45 ; reg: 0x045
        movlw 0x49
        movwf FSR ; reg: 0x004

label_004: ; address: 0x0030

        call function_009
        btfsc 0x43, 0x2 ; reg: 0x043
        goto label_010
        call function_006
        btfss 0x43, 0x0 ; reg: 0x043
        goto label_004
        movf 0x3c, W ; reg: 0x03c
        movwf 0x48 ; reg: 0x048
        movwf INDF ; reg: 0x000
        incf FSR, F ; reg: 0x004

label_005: ; address: 0x003a

        call function_001
        movf 0x41, W ; reg: 0x041
        movwf 0x47 ; reg: 0x047
        comf 0x47, F ; reg: 0x047
        movf 0x48, W ; reg: 0x048
        addwf 0x47, F ; reg: 0x047
        incfsz 0x47, F ; reg: 0x047
        goto label_007
        goto label_006

label_006: ; address: 0x0043

        movf 0x3c, W ; reg: 0x03c
        movwf 0x48 ; reg: 0x048
        goto label_005

label_007: ; address: 0x0046

        movf 0x41, W ; reg: 0x041
        movwf INDF ; reg: 0x000
        incf FSR, F ; reg: 0x004
        call function_008
        call function_007
        call function_002
        call function_013
        movlw 0xeb
        addwf 0x45, F ; reg: 0x045
        incf 0x45, F ; reg: 0x045
        btfsc STATUS, Z ; reg: 0x003, bit: 2
        goto label_008
        call function_014
        incf 0x45, F ; reg: 0x045
        goto label_004

label_008: ; address: 0x0055

        call function_002

label_009: ; address: 0x0056

        call function_010
        call function_009
        btfss 0x43, 0x2 ; reg: 0x043
        goto label_009
        movlw 0x15
        movwf 0x45 ; reg: 0x045

label_010: ; address: 0x005c

        call function_012
        decf 0x45, F ; reg: 0x045
        movlw 0x4a
        movwf FSR ; reg: 0x004

label_011: ; address: 0x0060

        call function_006
        btfss 0x43, 0x0 ; reg: 0x043
        goto label_011
        comf 0x3c, F ; reg: 0x03c
        movf INDF, W ; reg: 0x000
        addwf 0x3c, F ; reg: 0x03c
        incf 0x3c, F ; reg: 0x03c
        btfsc STATUS, Z ; reg: 0x003, bit: 2
        goto label_012
        call function_001
        call function_008
        call function_007
        call function_002
        decf FSR, F ; reg: 0x004
        goto label_013

label_012: ; address: 0x006f

        decf FSR, F ; reg: 0x004
        movf INDF, W ; reg: 0x000
        movwf 0x41 ; reg: 0x041
        call function_008
        call function_007
        call function_002

label_013: ; address: 0x0075

        decf 0x45, F ; reg: 0x045
        btfsc STATUS, Z ; reg: 0x003, bit: 2
        goto label_003
        incf FSR, F ; reg: 0x004
        incf FSR, F ; reg: 0x004
        incf FSR, F ; reg: 0x004
        goto label_011

label_014: ; address: 0x007c

        call function_015

label_015: ; address: 0x007d

        bcf PORTD, RD0 ; reg: 0x008, bit: 0
        bsf PORTD, RD1 ; reg: 0x008, bit: 1
        bsf PORTD, RD2 ; reg: 0x008, bit: 2
        btfsc PORTB, RB0 ; reg: 0x006, bit: 0
        goto label_017
        incfsz 0x20, W ; reg: 0x020
        movwf 0x20 ; reg: 0x020
        btfss 0x20, 0x7 ; reg: 0x020
        goto label_017
        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD5 ; reg: 0x008, bit: 5

label_016: ; address: 0x0088

        btfss PORTB, RB0 ; reg: 0x006, bit: 0
        goto label_016
        goto label_068

label_017: ; address: 0x008b

        btfsc PORTB, RB1 ; reg: 0x006, bit: 1
        goto label_019
        incfsz 0x21, W ; reg: 0x021
        movwf 0x21 ; reg: 0x021
        btfss 0x21, 0x7 ; reg: 0x021
        goto label_019
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD5 ; reg: 0x008, bit: 5

label_018: ; address: 0x0093

        btfss PORTB, RB1 ; reg: 0x006, bit: 1
        goto label_018
        goto label_068

label_019: ; address: 0x0096

        btfsc PORTB, RB2 ; reg: 0x006, bit: 2
        goto label_021
        incfsz 0x22, W ; reg: 0x022
        movwf 0x22 ; reg: 0x022
        btfss 0x22, 0x7 ; reg: 0x022
        goto label_021
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD5 ; reg: 0x008, bit: 5

label_020: ; address: 0x009e

        btfss PORTB, RB2 ; reg: 0x006, bit: 2
        goto label_020
        goto label_068

label_021: ; address: 0x00a1

        btfsc PORTB, RB3 ; reg: 0x006, bit: 3
        goto label_023
        incfsz 0x23, W ; reg: 0x023
        movwf 0x23 ; reg: 0x023
        btfss 0x23, 0x7 ; reg: 0x023
        goto label_023
        bsf PORTC, RC4 ; reg: 0x007, bit: 4
        bsf PORTD, RD5 ; reg: 0x008, bit: 5

label_022: ; address: 0x00a9

        btfss PORTB, RB3 ; reg: 0x006, bit: 3
        goto label_022
        goto label_068

label_023: ; address: 0x00ac

        btfsc PORTB, RB4 ; reg: 0x006, bit: 4
        goto label_025
        incfsz 0x24, W ; reg: 0x024
        movwf 0x24 ; reg: 0x024
        btfss 0x24, 0x7 ; reg: 0x024
        goto label_025
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD5 ; reg: 0x008, bit: 5

label_024: ; address: 0x00b4

        btfss PORTB, RB4 ; reg: 0x006, bit: 4
        goto label_024
        goto label_068

label_025: ; address: 0x00b7

        btfsc PORTB, RB5 ; reg: 0x006, bit: 5
        goto label_027
        incfsz 0x25, W ; reg: 0x025
        movwf 0x25 ; reg: 0x025
        btfss 0x25, 0x7 ; reg: 0x025
        goto label_027
        bsf PORTC, RC6 ; reg: 0x007, bit: 6
        bsf PORTD, RD5 ; reg: 0x008, bit: 5

label_026: ; address: 0x00bf

        btfss PORTB, RB5 ; reg: 0x006, bit: 5
        goto label_026
        goto label_068

label_027: ; address: 0x00c2

        btfsc PORTA, RA0 ; reg: 0x005, bit: 0
        goto label_029
        incfsz 0x26, W ; reg: 0x026
        movwf 0x26 ; reg: 0x026
        btfss 0x26, 0x7 ; reg: 0x026
        goto label_029
        bsf PORTC, RC7 ; reg: 0x007, bit: 7
        bsf PORTD, RD5 ; reg: 0x008, bit: 5

label_028: ; address: 0x00ca

        btfss PORTA, RA0 ; reg: 0x005, bit: 0
        goto label_028
        goto label_068

label_029: ; address: 0x00cd

        btfsc PORTA, RA1 ; reg: 0x005, bit: 1
        goto label_031
        incfsz 0x27, W ; reg: 0x027
        movwf 0x27 ; reg: 0x027
        btfss 0x27, 0x7 ; reg: 0x027
        goto label_031
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD5 ; reg: 0x008, bit: 5

label_030: ; address: 0x00d5

        btfss PORTA, RA1 ; reg: 0x005, bit: 1
        goto label_030
        goto label_068

label_031: ; address: 0x00d8

        btfsc PORTA, RA2 ; reg: 0x005, bit: 2
        goto label_033
        incfsz 0x28, W ; reg: 0x028
        movwf 0x28 ; reg: 0x028
        btfss 0x28, 0x7 ; reg: 0x028
        goto label_033
        bsf PORTC, RC3 ; reg: 0x007, bit: 3
        bsf PORTD, RD5 ; reg: 0x008, bit: 5

label_032: ; address: 0x00e0

        btfss PORTA, RA2 ; reg: 0x005, bit: 2
        goto label_032
        goto label_068

label_033: ; address: 0x00e3

        bsf PORTD, RD0 ; reg: 0x008, bit: 0
        bcf PORTD, RD1 ; reg: 0x008, bit: 1
        bsf PORTD, RD2 ; reg: 0x008, bit: 2
        btfsc PORTB, RB1 ; reg: 0x006, bit: 1
        goto label_035
        incfsz 0x29, W ; reg: 0x029
        movwf 0x29 ; reg: 0x029
        btfss 0x29, 0x7 ; reg: 0x029
        goto label_035
        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD6 ; reg: 0x008, bit: 6

label_034: ; address: 0x00ee

        btfss PORTB, RB1 ; reg: 0x006, bit: 1
        goto label_034
        goto label_068

label_035: ; address: 0x00f1

        btfsc PORTB, RB2 ; reg: 0x006, bit: 2
        goto label_037
        incfsz 0x2a, W ; reg: 0x02a
        movwf 0x2a ; reg: 0x02a
        btfss 0x2a, 0x7 ; reg: 0x02a
        goto label_037
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD6 ; reg: 0x008, bit: 6

label_036: ; address: 0x00f9

        btfss PORTB, RB2 ; reg: 0x006, bit: 2
        goto label_036
        goto label_068

label_037: ; address: 0x00fc

        btfsc PORTB, RB3 ; reg: 0x006, bit: 3
        goto label_039
        incfsz 0x2b, W ; reg: 0x02b
        movwf 0x2b ; reg: 0x02b
        btfss 0x2b, 0x7 ; reg: 0x02b
        goto label_039
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD6 ; reg: 0x008, bit: 6

label_038: ; address: 0x0104

        btfss PORTB, RB3 ; reg: 0x006, bit: 3
        goto label_038
        goto label_068

label_039: ; address: 0x0107

        btfsc PORTB, RB4 ; reg: 0x006, bit: 4
        goto label_041
        incfsz 0x2c, W ; reg: 0x02c
        movwf 0x2c ; reg: 0x02c
        btfss 0x2c, 0x7 ; reg: 0x02c
        goto label_041
        bsf PORTC, RC4 ; reg: 0x007, bit: 4
        bsf PORTD, RD6 ; reg: 0x008, bit: 6

label_040: ; address: 0x010f

        btfss PORTB, RB4 ; reg: 0x006, bit: 4
        goto label_040
        goto label_068

label_041: ; address: 0x0112

        btfsc PORTB, RB5 ; reg: 0x006, bit: 5
        goto label_043
        incfsz 0x2d, W ; reg: 0x02d
        movwf 0x2d ; reg: 0x02d
        btfss 0x2d, 0x7 ; reg: 0x02d
        goto label_043
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD6 ; reg: 0x008, bit: 6

label_042: ; address: 0x011a

        btfss PORTB, RB5 ; reg: 0x006, bit: 5
        goto label_042
        goto label_068

label_043: ; address: 0x011d

        btfsc PORTA, RA0 ; reg: 0x005, bit: 0
        goto label_045
        incfsz 0x2e, W ; reg: 0x02e
        movwf 0x2e ; reg: 0x02e
        btfss 0x2e, 0x7 ; reg: 0x02e
        goto label_045
        bsf PORTC, RC6 ; reg: 0x007, bit: 6
        bsf PORTD, RD6 ; reg: 0x008, bit: 6

label_044: ; address: 0x0125

        btfss PORTA, RA0 ; reg: 0x005, bit: 0
        goto label_044
        goto label_068

label_045: ; address: 0x0128

        btfsc PORTA, RA1 ; reg: 0x005, bit: 1
        goto label_047
        incfsz 0x2f, W ; reg: 0x02f
        movwf 0x2f ; reg: 0x02f
        btfss 0x2f, 0x7 ; reg: 0x02f
        goto label_047
        bsf PORTC, RC7 ; reg: 0x007, bit: 7
        bsf PORTD, RD6 ; reg: 0x008, bit: 6

label_046: ; address: 0x0130

        btfss PORTA, RA1 ; reg: 0x005, bit: 1
        goto label_046
        goto label_068

label_047: ; address: 0x0133

        btfsc PORTA, RA2 ; reg: 0x005, bit: 2
        goto label_049
        incfsz 0x30, W ; reg: 0x030
        movwf 0x30 ; reg: 0x030
        btfss 0x30, 0x7 ; reg: 0x030
        goto label_049
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD6 ; reg: 0x008, bit: 6

label_048: ; address: 0x013b

        btfss PORTA, RA2 ; reg: 0x005, bit: 2
        goto label_048
        goto label_068

label_049: ; address: 0x013e

        bsf PORTD, RD0 ; reg: 0x008, bit: 0
        bsf PORTD, RD1 ; reg: 0x008, bit: 1
        bcf PORTD, RD2 ; reg: 0x008, bit: 2
        btfsc PORTB, RB0 ; reg: 0x006, bit: 0
        goto label_051
        incfsz 0x31, W ; reg: 0x031
        movwf 0x31 ; reg: 0x031
        btfss 0x31, 0x7 ; reg: 0x031
        goto label_051
        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_050: ; address: 0x0149

        btfss PORTB, RB0 ; reg: 0x006, bit: 0
        goto label_050
        goto label_068

label_051: ; address: 0x014c

        btfsc PORTB, RB1 ; reg: 0x006, bit: 1
        goto label_053
        incfsz 0x32, W ; reg: 0x032
        movwf 0x32 ; reg: 0x032
        btfss 0x32, 0x7 ; reg: 0x032
        goto label_053
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_052: ; address: 0x0154

        btfss PORTB, RB1 ; reg: 0x006, bit: 1
        goto label_052
        goto label_068

label_053: ; address: 0x0157

        btfsc PORTB, RB2 ; reg: 0x006, bit: 2
        goto label_055
        incfsz 0x33, W ; reg: 0x033
        movwf 0x33 ; reg: 0x033
        btfss 0x33, 0x7 ; reg: 0x033
        goto label_055
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_054: ; address: 0x015f

        btfss PORTB, RB2 ; reg: 0x006, bit: 2
        goto label_054
        goto label_068

label_055: ; address: 0x0162

        btfsc PORTB, RB3 ; reg: 0x006, bit: 3
        goto label_057
        incfsz 0x34, W ; reg: 0x034
        movwf 0x34 ; reg: 0x034
        btfss 0x34, 0x7 ; reg: 0x034
        goto label_057
        bsf PORTC, RC4 ; reg: 0x007, bit: 4
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_056: ; address: 0x016a

        btfss PORTB, RB3 ; reg: 0x006, bit: 3
        goto label_056
        goto label_068

label_057: ; address: 0x016d

        btfsc PORTB, RB4 ; reg: 0x006, bit: 4
        goto label_059
        incfsz 0x35, W ; reg: 0x035
        movwf 0x35 ; reg: 0x035
        btfss 0x35, 0x7 ; reg: 0x035
        goto label_059
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_058: ; address: 0x0175

        btfss PORTB, RB4 ; reg: 0x006, bit: 4
        goto label_058
        goto label_068

label_059: ; address: 0x0178

        btfsc PORTB, RB5 ; reg: 0x006, bit: 5
        goto label_061
        incfsz 0x36, W ; reg: 0x036
        movwf 0x36 ; reg: 0x036
        btfss 0x36, 0x7 ; reg: 0x036
        goto label_061
        bsf PORTC, RC6 ; reg: 0x007, bit: 6
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_060: ; address: 0x0180

        btfss PORTB, RB5 ; reg: 0x006, bit: 5
        goto label_060
        goto label_068

label_061: ; address: 0x0183

        btfsc PORTA, RA0 ; reg: 0x005, bit: 0
        goto label_063
        incfsz 0x37, W ; reg: 0x037
        movwf 0x37 ; reg: 0x037
        btfss 0x37, 0x7 ; reg: 0x037
        goto label_063
        bsf PORTC, RC7 ; reg: 0x007, bit: 7
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_062: ; address: 0x018b

        btfss PORTA, RA0 ; reg: 0x005, bit: 0
        goto label_062
        goto label_068

label_063: ; address: 0x018e

        btfsc PORTA, RA1 ; reg: 0x005, bit: 1
        goto label_065
        incfsz 0x38, W ; reg: 0x038
        movwf 0x38 ; reg: 0x038
        btfss 0x38, 0x7 ; reg: 0x038
        goto label_065
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_064: ; address: 0x0196

        btfss PORTA, RA1 ; reg: 0x005, bit: 1
        goto label_064
        goto label_068

label_065: ; address: 0x0199

        btfsc PORTA, RA2 ; reg: 0x005, bit: 2
        goto label_067
        incfsz 0x39, W ; reg: 0x039
        movwf 0x39 ; reg: 0x039
        btfss 0x39, 0x7 ; reg: 0x039
        goto label_067
        bsf PORTC, RC3 ; reg: 0x007, bit: 3
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_066: ; address: 0x01a1

        btfss PORTA, RA2 ; reg: 0x005, bit: 2
        goto label_066
        goto label_068

label_067: ; address: 0x01a4

        goto label_015

label_068: ; address: 0x01a5

        call function_002
        call function_000
        goto label_015

function_000: ; address: 0x01a8

        clrf 0x20 ; reg: 0x020
        clrf 0x21 ; reg: 0x021
        clrf 0x22 ; reg: 0x022
        clrf 0x23 ; reg: 0x023
        clrf 0x24 ; reg: 0x024
        clrf 0x25 ; reg: 0x025
        clrf 0x26 ; reg: 0x026
        clrf 0x27 ; reg: 0x027
        clrf 0x28 ; reg: 0x028
        clrf 0x29 ; reg: 0x029
        clrf 0x2a ; reg: 0x02a
        clrf 0x2b ; reg: 0x02b
        clrf 0x2c ; reg: 0x02c
        clrf 0x2d ; reg: 0x02d
        clrf 0x2e ; reg: 0x02e
        clrf 0x2f ; reg: 0x02f
        clrf 0x30 ; reg: 0x030
        clrf 0x31 ; reg: 0x031
        clrf 0x32 ; reg: 0x032
        clrf 0x33 ; reg: 0x033
        clrf 0x34 ; reg: 0x034
        clrf 0x35 ; reg: 0x035
        clrf 0x36 ; reg: 0x036
        clrf 0x37 ; reg: 0x037
        clrf 0x38 ; reg: 0x038
        clrf 0x39 ; reg: 0x039
        clrf 0x3a ; reg: 0x03a
        return

function_001: ; address: 0x01c4

        movf TMR0, W ; reg: 0x001
        movwf 0x41 ; reg: 0x041
        movlw 0x1f
        andwf 0x41, W ; reg: 0x041
        movwf 0x41 ; reg: 0x041
        addlw 0xe6
        btfsc STATUS, C ; reg: 0x003, bit: 0
        goto label_069
        goto label_070

label_069: ; address: 0x01cd

        goto function_001
        movwf 0x41 ; reg: 0x041
        comf 0x41, F ; reg: 0x041
        movlw 0xe0
        andwf 0x41, F ; reg: 0x041

label_070: ; address: 0x01d2

        movf 0x41, W ; reg: 0x041
        btfsc STATUS, Z ; reg: 0x003, bit: 2
        goto function_001
        return
        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_003
        bcf PORTC, RC2 ; reg: 0x007, bit: 2
        bcf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_003

label_071: ; address: 0x01dc

        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        bcf PORTC, RC2 ; reg: 0x007, bit: 2
        bcf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        call function_003
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        bcf PORTC, RC1 ; reg: 0x007, bit: 1
        bcf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        bcf PORTC, RC0 ; reg: 0x007, bit: 0
        bcf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        bcf PORTD, RD4 ; reg: 0x008, bit: 4
        bcf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        bcf PORTC, RC5 ; reg: 0x007, bit: 5
        bcf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        goto label_071

function_002: ; address: 0x01fc

        clrf PORTD ; reg: 0x008
        clrf PORTC ; reg: 0x007
        return
        bcf PORTD, RD0 ; reg: 0x008, bit: 0
        bcf PORTD, RD1 ; reg: 0x008, bit: 1
        bcf PORTD, RD2 ; reg: 0x008, bit: 2
        bcf PORTC, RC2 ; reg: 0x007, bit: 2
        bcf PORTC, RC1 ; reg: 0x007, bit: 1
        bcf PORTC, RC0 ; reg: 0x007, bit: 0
        bcf PORTD, RD4 ; reg: 0x008, bit: 4
        bcf PORTC, RC5 ; reg: 0x007, bit: 5
        bcf PORTC, RC6 ; reg: 0x007, bit: 6
        bcf PORTC, RC7 ; reg: 0x007, bit: 7
        bcf PORTC, RC4 ; reg: 0x007, bit: 4
        bcf PORTC, RC3 ; reg: 0x007, bit: 3
        return

function_003: ; address: 0x020c

        movlw 0x64
        movwf 0x3f ; reg: 0x03f

label_072: ; address: 0x020e

        movlw 0x28
        movwf 0x3e ; reg: 0x03e

label_073: ; address: 0x0210

        movlw 0x28
        movwf 0x3d ; reg: 0x03d

label_074: ; address: 0x0212

        decfsz 0x3d, F ; reg: 0x03d
        goto label_074
        decfsz 0x3e, F ; reg: 0x03e
        goto label_073
        decfsz 0x3f, F ; reg: 0x03f
        goto label_072
        return

function_004: ; address: 0x0219

        movlw 0x0a
        movwf 0x3f ; reg: 0x03f

label_075: ; address: 0x021b

        movlw 0x28
        movwf 0x3e ; reg: 0x03e

label_076: ; address: 0x021d

        movlw 0x28
        movwf 0x3d ; reg: 0x03d

label_077: ; address: 0x021f

        decfsz 0x3d, F ; reg: 0x03d
        goto label_077
        decfsz 0x3e, F ; reg: 0x03e
        goto label_076
        decfsz 0x3f, F ; reg: 0x03f
        goto label_075
        return

function_005: ; address: 0x0226

        movlw 0x2d
        movwf 0x3f ; reg: 0x03f

label_078: ; address: 0x0228

        movlw 0x28
        movwf 0x3e ; reg: 0x03e

label_079: ; address: 0x022a

        movlw 0x28
        movwf 0x3d ; reg: 0x03d

label_080: ; address: 0x022c

        decfsz 0x3d, F ; reg: 0x03d
        goto label_080
        decfsz 0x3e, F ; reg: 0x03e
        goto label_079
        decfsz 0x3f, F ; reg: 0x03f
        goto label_078
        return

label_081: ; address: 0x0233

        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_003
        bcf PORTC, RC2 ; reg: 0x007, bit: 2
        bcf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_003
        goto label_081

label_082: ; address: 0x023a

        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_003
        bcf PORTC, RC1 ; reg: 0x007, bit: 1
        bcf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_003
        goto label_082
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_003
        bcf PORTC, RC0 ; reg: 0x007, bit: 0
        bcf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_003
        return

function_006: ; address: 0x0248

        bcf 0x43, 0x0 ; reg: 0x043
        bcf PORTD, RD0 ; reg: 0x008, bit: 0
        bsf PORTD, RD1 ; reg: 0x008, bit: 1
        bsf PORTD, RD2 ; reg: 0x008, bit: 2
        btfsc PORTB, RB0 ; reg: 0x006, bit: 0
        goto label_083
        incfsz 0x20, W ; reg: 0x020
        movwf 0x20 ; reg: 0x020
        btfss 0x20, 0x7 ; reg: 0x020
        goto label_083
        btfss 0x20, 0x6 ; reg: 0x020
        goto label_083
        movlw 0x01
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_083: ; address: 0x0257

        btfsc PORTB, RB1 ; reg: 0x006, bit: 1
        goto label_084
        incfsz 0x21, W ; reg: 0x021
        movwf 0x21 ; reg: 0x021
        btfss 0x21, 0x7 ; reg: 0x021
        goto label_084
        btfss 0x21, 0x6 ; reg: 0x021
        goto label_084
        movlw 0x02
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_084: ; address: 0x0262

        btfsc PORTB, RB2 ; reg: 0x006, bit: 2
        goto label_085
        incfsz 0x22, W ; reg: 0x022
        movwf 0x22 ; reg: 0x022
        btfss 0x22, 0x7 ; reg: 0x022
        goto label_085
        btfss 0x22, 0x6 ; reg: 0x022
        goto label_085
        movlw 0x03
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_085: ; address: 0x026d

        btfsc PORTB, RB3 ; reg: 0x006, bit: 3
        goto label_086
        incfsz 0x23, W ; reg: 0x023
        movwf 0x23 ; reg: 0x023
        btfss 0x23, 0x7 ; reg: 0x023
        goto label_086
        btfss 0x23, 0x6 ; reg: 0x023
        goto label_086
        movlw 0x04
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_086: ; address: 0x0278

        btfsc PORTB, RB4 ; reg: 0x006, bit: 4
        goto label_087
        incfsz 0x24, W ; reg: 0x024
        movwf 0x24 ; reg: 0x024
        btfss 0x24, 0x7 ; reg: 0x024
        goto label_087
        btfss 0x24, 0x6 ; reg: 0x024
        goto label_087
        movlw 0x05
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_087: ; address: 0x0283

        btfsc PORTB, RB5 ; reg: 0x006, bit: 5
        goto label_088
        incfsz 0x25, W ; reg: 0x025
        movwf 0x25 ; reg: 0x025
        btfss 0x25, 0x7 ; reg: 0x025
        goto label_088
        btfss 0x25, 0x6 ; reg: 0x025
        goto label_088
        movlw 0x06
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_088: ; address: 0x028e

        btfsc PORTA, RA0 ; reg: 0x005, bit: 0
        goto label_089
        incfsz 0x26, W ; reg: 0x026
        movwf 0x26 ; reg: 0x026
        btfss 0x26, 0x7 ; reg: 0x026
        goto label_089
        btfss 0x26, 0x6 ; reg: 0x026
        goto label_089
        movlw 0x07
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_089: ; address: 0x0299

        btfsc PORTA, RA1 ; reg: 0x005, bit: 1
        goto label_090
        incfsz 0x27, W ; reg: 0x027
        movwf 0x27 ; reg: 0x027
        btfss 0x27, 0x7 ; reg: 0x027
        goto label_090
        btfss 0x27, 0x6 ; reg: 0x027
        goto label_090
        movlw 0x08
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_090: ; address: 0x02a4

        btfsc PORTA, RA2 ; reg: 0x005, bit: 2
        goto label_091
        incfsz 0x28, W ; reg: 0x028
        movwf 0x28 ; reg: 0x028
        btfss 0x28, 0x7 ; reg: 0x028
        goto label_091
        btfss 0x28, 0x6 ; reg: 0x028
        goto label_091
        movlw 0x09
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_091: ; address: 0x02af

        movlw 0x00
        movwf 0x3c ; reg: 0x03c
        bsf PORTD, RD0 ; reg: 0x008, bit: 0
        bcf PORTD, RD1 ; reg: 0x008, bit: 1
        bsf PORTD, RD2 ; reg: 0x008, bit: 2
        btfsc PORTB, RB1 ; reg: 0x006, bit: 1
        goto label_092
        incfsz 0x29, W ; reg: 0x029
        movwf 0x29 ; reg: 0x029
        btfss 0x29, 0x7 ; reg: 0x029
        goto label_092
        btfss 0x29, 0x6 ; reg: 0x029
        goto label_092
        movlw 0x0a
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_092: ; address: 0x02bf

        btfsc PORTB, RB2 ; reg: 0x006, bit: 2
        goto label_093
        incfsz 0x2a, W ; reg: 0x02a
        movwf 0x2a ; reg: 0x02a
        btfss 0x2a, 0x7 ; reg: 0x02a
        goto label_093
        btfss 0x2a, 0x6 ; reg: 0x02a
        goto label_093
        movlw 0x0b
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_093: ; address: 0x02ca

        btfsc PORTB, RB3 ; reg: 0x006, bit: 3
        goto label_094
        incfsz 0x2b, W ; reg: 0x02b
        movwf 0x2b ; reg: 0x02b
        btfss 0x2b, 0x7 ; reg: 0x02b
        goto label_094
        btfss 0x2b, 0x6 ; reg: 0x02b
        goto label_094
        movlw 0x0c
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_094: ; address: 0x02d5

        btfsc PORTB, RB4 ; reg: 0x006, bit: 4
        goto label_095
        incfsz 0x2c, W ; reg: 0x02c
        movwf 0x2c ; reg: 0x02c
        btfss 0x2c, 0x7 ; reg: 0x02c
        goto label_095
        btfss 0x2c, 0x6 ; reg: 0x02c
        goto label_095
        movlw 0x0d
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_095: ; address: 0x02e0

        btfsc PORTB, RB5 ; reg: 0x006, bit: 5
        goto label_096
        incfsz 0x2d, W ; reg: 0x02d
        movwf 0x2d ; reg: 0x02d
        btfss 0x2d, 0x7 ; reg: 0x02d
        goto label_096
        btfss 0x2d, 0x6 ; reg: 0x02d
        goto label_096
        movlw 0x0e
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_096: ; address: 0x02eb

        btfsc PORTA, RA0 ; reg: 0x005, bit: 0
        goto label_097
        incfsz 0x2e, W ; reg: 0x02e
        movwf 0x2e ; reg: 0x02e
        btfss 0x2e, 0x7 ; reg: 0x02e
        goto label_097
        btfss 0x2e, 0x6 ; reg: 0x02e
        goto label_097
        movlw 0x0f
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_097: ; address: 0x02f6

        btfsc PORTA, RA1 ; reg: 0x005, bit: 1
        goto label_098
        incfsz 0x2f, W ; reg: 0x02f
        movwf 0x2f ; reg: 0x02f
        btfss 0x2f, 0x7 ; reg: 0x02f
        goto label_098
        btfss 0x2f, 0x6 ; reg: 0x02f
        goto label_098
        movlw 0x10
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_098: ; address: 0x0301

        btfsc PORTA, RA2 ; reg: 0x005, bit: 2
        goto label_099
        incfsz 0x30, W ; reg: 0x030
        movwf 0x30 ; reg: 0x030
        btfss 0x30, 0x7 ; reg: 0x030
        goto label_099
        btfss 0x30, 0x6 ; reg: 0x030
        goto label_099
        movlw 0x11
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_099: ; address: 0x030c

        bsf PORTD, RD0 ; reg: 0x008, bit: 0
        bsf PORTD, RD1 ; reg: 0x008, bit: 1
        bcf PORTD, RD2 ; reg: 0x008, bit: 2
        btfsc PORTB, RB0 ; reg: 0x006, bit: 0
        goto label_100
        incfsz 0x31, W ; reg: 0x031
        movwf 0x31 ; reg: 0x031
        btfss 0x31, 0x7 ; reg: 0x031
        goto label_100
        btfss 0x31, 0x6 ; reg: 0x031
        goto label_100
        movlw 0x12
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_100: ; address: 0x031a

        btfsc PORTB, RB1 ; reg: 0x006, bit: 1
        goto label_101
        incfsz 0x32, W ; reg: 0x032
        movwf 0x32 ; reg: 0x032
        btfss 0x32, 0x7 ; reg: 0x032
        goto label_101
        btfss 0x32, 0x6 ; reg: 0x032
        goto label_101
        movlw 0x13
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_101: ; address: 0x0325

        btfsc PORTB, RB2 ; reg: 0x006, bit: 2
        goto label_102
        incfsz 0x33, W ; reg: 0x033
        movwf 0x33 ; reg: 0x033
        btfss 0x33, 0x7 ; reg: 0x033
        goto label_102
        movlw 0x14
        movwf 0x3c ; reg: 0x03c
        btfss 0x33, 0x6 ; reg: 0x033
        goto label_102
        goto label_108

label_102: ; address: 0x0330

        btfsc PORTB, RB3 ; reg: 0x006, bit: 3
        goto label_103
        incfsz 0x34, W ; reg: 0x034
        movwf 0x34 ; reg: 0x034
        btfss 0x34, 0x7 ; reg: 0x034
        goto label_103
        btfss 0x34, 0x6 ; reg: 0x034
        goto label_103
        movlw 0x15
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_103: ; address: 0x033b

        btfsc PORTB, RB4 ; reg: 0x006, bit: 4
        goto label_104
        incfsz 0x35, W ; reg: 0x035
        movwf 0x35 ; reg: 0x035
        btfss 0x35, 0x7 ; reg: 0x035
        goto label_104
        btfss 0x35, 0x6 ; reg: 0x035
        goto label_104
        movlw 0x16
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_104: ; address: 0x0346

        btfsc PORTB, RB5 ; reg: 0x006, bit: 5
        goto label_105
        incfsz 0x36, W ; reg: 0x036
        movwf 0x36 ; reg: 0x036
        btfss 0x36, 0x7 ; reg: 0x036
        goto label_105
        btfss 0x36, 0x6 ; reg: 0x036
        goto label_105
        movlw 0x17
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_105: ; address: 0x0351

        btfsc PORTA, RA0 ; reg: 0x005, bit: 0
        goto label_106
        incfsz 0x37, W ; reg: 0x037
        movwf 0x37 ; reg: 0x037
        btfss 0x37, 0x7 ; reg: 0x037
        goto label_106
        btfss 0x37, 0x6 ; reg: 0x037
        goto label_106
        movlw 0x18
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_106: ; address: 0x035c

        btfsc PORTA, RA1 ; reg: 0x005, bit: 1
        goto label_107
        incfsz 0x38, W ; reg: 0x038
        movwf 0x38 ; reg: 0x038
        btfss 0x38, 0x7 ; reg: 0x038
        goto label_107
        btfss 0x38, 0x6 ; reg: 0x038
        goto label_107
        movlw 0x19
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_107: ; address: 0x0367

        btfsc PORTA, RA2 ; reg: 0x005, bit: 2
        goto label_109
        incfsz 0x39, W ; reg: 0x039
        movwf 0x39 ; reg: 0x039
        btfss 0x39, 0x7 ; reg: 0x039
        goto label_109
        btfss 0x39, 0x6 ; reg: 0x039
        goto label_109
        movlw 0x1a
        movwf 0x3c ; reg: 0x03c
        goto label_108

label_108: ; address: 0x0372

        call function_000
        bsf 0x43, 0x0 ; reg: 0x043

label_109: ; address: 0x0374

        return

function_007: ; address: 0x0375

        btfss PORTB, RB0 ; reg: 0x006, bit: 0
        goto function_007
        btfss PORTB, RB1 ; reg: 0x006, bit: 1
        goto function_007
        btfss PORTB, RB2 ; reg: 0x006, bit: 2
        goto function_007
        btfss PORTB, RB3 ; reg: 0x006, bit: 3
        goto function_007
        btfss PORTB, RB4 ; reg: 0x006, bit: 4
        goto function_007
        btfss PORTB, RB5 ; reg: 0x006, bit: 5
        goto function_007
        btfss PORTA, RA0 ; reg: 0x005, bit: 0
        goto function_007
        btfss PORTA, RA1 ; reg: 0x005, bit: 1
        goto function_007
        btfss PORTA, RA2 ; reg: 0x005, bit: 2
        goto function_007
        return

function_008: ; address: 0x0388

        movf 0x41, W ; reg: 0x041
        movwf 0x3d ; reg: 0x03d
        movlw 0xfe
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_110
        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        goto label_136

label_110: ; address: 0x0392

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xfd
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_111
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        goto label_136

label_111: ; address: 0x039c

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xfc
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_112
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        goto label_136

label_112: ; address: 0x03a6

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xfb
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_113
        bsf PORTC, RC4 ; reg: 0x007, bit: 4
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        goto label_136

label_113: ; address: 0x03b0

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xfa
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_114
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        goto label_136

label_114: ; address: 0x03ba

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf9
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_115
        bsf PORTC, RC6 ; reg: 0x007, bit: 6
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        goto label_136

label_115: ; address: 0x03c4

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf8
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_116
        bsf PORTC, RC7 ; reg: 0x007, bit: 7
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        goto label_136

label_116: ; address: 0x03ce

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf7
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_117
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        goto label_136

label_117: ; address: 0x03d8

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf6
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_118
        bsf PORTC, RC3 ; reg: 0x007, bit: 3
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        goto label_136

label_118: ; address: 0x03e2

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf5
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_119
        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        goto label_136

label_119: ; address: 0x03ec

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf4
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_120
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        goto label_136

label_120: ; address: 0x03f6

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf3
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_121
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        goto label_136

label_121: ; address: 0x0400

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf2
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_122
        bsf PORTC, RC4 ; reg: 0x007, bit: 4
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        goto label_136

label_122: ; address: 0x040a

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf1
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_123
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        goto label_136

label_123: ; address: 0x0414

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xf0
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_124
        bsf PORTC, RC6 ; reg: 0x007, bit: 6
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        goto label_136

label_124: ; address: 0x041e

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xef
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_125
        bsf PORTC, RC7 ; reg: 0x007, bit: 7
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        goto label_136

label_125: ; address: 0x0428

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xee
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_126
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        goto label_136

label_126: ; address: 0x0432

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xed
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_127
        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        goto label_136

label_127: ; address: 0x043c

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xec
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_128
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        goto label_136

label_128: ; address: 0x0446

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xeb
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_129
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        goto label_136

label_129: ; address: 0x0450

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xea
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_130
        bsf PORTC, RC4 ; reg: 0x007, bit: 4
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        goto label_136

label_130: ; address: 0x045a

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xe9
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_131
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        goto label_136

label_131: ; address: 0x0464

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xe8
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_132
        bsf PORTC, RC6 ; reg: 0x007, bit: 6
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        goto label_136

label_132: ; address: 0x046e

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xe7
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_133
        bsf PORTC, RC7 ; reg: 0x007, bit: 7
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        goto label_136

label_133: ; address: 0x0478

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xe6
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_134
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        goto label_136

label_134: ; address: 0x0482

        movf 0x3d, W ; reg: 0x03d
        movwf 0x41 ; reg: 0x041
        movlw 0xe5
        addwf 0x41, F ; reg: 0x041
        incf 0x41, F ; reg: 0x041
        btfss STATUS, Z ; reg: 0x003, bit: 2
        goto label_135
        bsf PORTC, RC3 ; reg: 0x007, bit: 3
        bsf PORTD, RD7 ; reg: 0x008, bit: 7

label_135: ; address: 0x048b

        nop

label_136: ; address: 0x048c

        return

function_009: ; address: 0x048d

        bcf 0x43, 0x2 ; reg: 0x043
        btfsc PORTA, RA4 ; reg: 0x005, bit: 4
        goto label_137
        incfsz 0x44, W ; reg: 0x044
        movwf 0x44 ; reg: 0x044
        btfss 0x44, 0x7 ; reg: 0x044
        goto label_137
        bsf 0x43, 0x2 ; reg: 0x043

label_137: ; address: 0x0495

        return

function_010: ; address: 0x0496

        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_004
        bcf PORTC, RC0 ; reg: 0x007, bit: 0
        bcf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_004
        return

function_011: ; address: 0x049d

        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        bcf PORTC, RC0 ; reg: 0x007, bit: 0
        bcf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_003
        return

function_012: ; address: 0x04a4

        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_003
        bcf PORTC, RC0 ; reg: 0x007, bit: 0
        bcf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_003
        return

function_013: ; address: 0x04ab

        movf 0x45, W ; reg: 0x045
        movwf 0x46 ; reg: 0x046
        return

function_014: ; address: 0x04ae

        movf 0x46, W ; reg: 0x046
        movwf 0x45 ; reg: 0x045
        return

function_015: ; address: 0x04b1

        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_005
        call function_002
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_005
        call function_002
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_005
        call function_002
        bsf PORTC, RC4 ; reg: 0x007, bit: 4
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_005
        call function_002
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_005
        call function_002
        bsf PORTC, RC6 ; reg: 0x007, bit: 6
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_005
        call function_002
        bsf PORTC, RC7 ; reg: 0x007, bit: 7
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_005
        call function_002
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_005
        call function_002
        bsf PORTC, RC3 ; reg: 0x007, bit: 3
        bsf PORTD, RD5 ; reg: 0x008, bit: 5
        call function_005
        call function_002
        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_005
        call function_002
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_005
        call function_002
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_005
        call function_002
        bsf PORTC, RC4 ; reg: 0x007, bit: 4
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_005
        call function_002
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_005
        call function_002
        bsf PORTC, RC6 ; reg: 0x007, bit: 6
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_005
        call function_002
        bsf PORTC, RC7 ; reg: 0x007, bit: 7
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_005
        call function_002
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD6 ; reg: 0x008, bit: 6
        call function_005
        call function_002
        bsf PORTC, RC2 ; reg: 0x007, bit: 2
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_005
        call function_002
        bsf PORTC, RC1 ; reg: 0x007, bit: 1
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_005
        call function_002
        bsf PORTC, RC0 ; reg: 0x007, bit: 0
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_005
        call function_002
        bsf PORTC, RC4 ; reg: 0x007, bit: 4
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_005
        call function_002
        bsf PORTC, RC5 ; reg: 0x007, bit: 5
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_005
        call function_002
        bsf PORTC, RC6 ; reg: 0x007, bit: 6
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_005
        call function_002
        bsf PORTC, RC7 ; reg: 0x007, bit: 7
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_005
        call function_002
        bsf PORTD, RD4 ; reg: 0x008, bit: 4
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_005
        call function_002
        bsf PORTC, RC3 ; reg: 0x007, bit: 3
        bsf PORTD, RD7 ; reg: 0x008, bit: 7
        call function_005
        call function_002
        return
        retlw 0x00
        retlw 0x00
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff
        addlw 0xff

;===============================================================================
; EEDATA area

        ; eeprom

        org __EEPROM_START ; address: 0x2100

        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00
        db 0xff
        db 0x00

        end
