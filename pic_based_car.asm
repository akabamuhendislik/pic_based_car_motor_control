
_main:

;pic_based_car.c,26 :: 		void main ()
;pic_based_car.c,28 :: 		mcu_init();
	CALL       _mcu_init+0
;pic_based_car.c,30 :: 		while(1)
L_main0:
;pic_based_car.c,32 :: 		motor_control(forward);
	MOVLW      1
	MOVWF      FARG_motor_control_directions+0
	CALL       _motor_control+0
;pic_based_car.c,33 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;pic_based_car.c,34 :: 		motor_control(right);
	MOVLW      4
	MOVWF      FARG_motor_control_directions+0
	CALL       _motor_control+0
;pic_based_car.c,35 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;pic_based_car.c,36 :: 		motor_control(forward);
	MOVLW      1
	MOVWF      FARG_motor_control_directions+0
	CALL       _motor_control+0
;pic_based_car.c,37 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;pic_based_car.c,38 :: 		motor_control(left);
	MOVLW      3
	MOVWF      FARG_motor_control_directions+0
	CALL       _motor_control+0
;pic_based_car.c,39 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;pic_based_car.c,40 :: 		motor_control(backward);
	MOVLW      2
	MOVWF      FARG_motor_control_directions+0
	CALL       _motor_control+0
;pic_based_car.c,41 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;pic_based_car.c,42 :: 		motor_control(stop);
	MOVLW      5
	MOVWF      FARG_motor_control_directions+0
	CALL       _motor_control+0
;pic_based_car.c,43 :: 		}
	GOTO       L_main0
;pic_based_car.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_mcu_init:

;pic_based_car.c,48 :: 		void mcu_init(void)
;pic_based_car.c,50 :: 		portb = 0;      // portb yi sýfýrla
	CLRF       PORTB+0
;pic_based_car.c,51 :: 		porta = 0;      // porta yý sýfýrla
	CLRF       PORTA+0
;pic_based_car.c,52 :: 		cmcon = 0x07;   // Analog Komparatör ler kapalý
	MOVLW      7
	MOVWF      CMCON+0
;pic_based_car.c,53 :: 		trisa = 0x00;      // hepsi çýkýþ all output
	CLRF       TRISA+0
;pic_based_car.c,54 :: 		}
L_end_mcu_init:
	RETURN
; end of _mcu_init

_motor_control:

;pic_based_car.c,57 :: 		void motor_control (char direction)
;pic_based_car.c,60 :: 		if(direction==forward)
	MOVF       FARG_motor_control_direction+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_motor_control7
;pic_based_car.c,62 :: 		m11 = 1;
	BSF        RA0_bit+0, 0
;pic_based_car.c,63 :: 		m12 = 0;
	BCF        RA1_bit+0, 1
;pic_based_car.c,64 :: 		m21 = 1;
	BSF        RA2_bit+0, 2
;pic_based_car.c,65 :: 		m22 = 0;
	BCF        RA3_bit+0, 3
;pic_based_car.c,66 :: 		}
	GOTO       L_motor_control8
L_motor_control7:
;pic_based_car.c,68 :: 		else if(direction==backward)
	MOVF       FARG_motor_control_direction+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_motor_control9
;pic_based_car.c,70 :: 		m11 = 0;
	BCF        RA0_bit+0, 0
;pic_based_car.c,71 :: 		m12 = 1;
	BSF        RA1_bit+0, 1
;pic_based_car.c,72 :: 		m21 = 0;
	BCF        RA2_bit+0, 2
;pic_based_car.c,73 :: 		m22 = 1;
	BSF        RA3_bit+0, 3
;pic_based_car.c,74 :: 		}
	GOTO       L_motor_control10
L_motor_control9:
;pic_based_car.c,76 :: 		else if(direction==left)
	MOVF       FARG_motor_control_direction+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_motor_control11
;pic_based_car.c,78 :: 		m11 = 1;
	BSF        RA0_bit+0, 0
;pic_based_car.c,79 :: 		m12 = 0;
	BCF        RA1_bit+0, 1
;pic_based_car.c,80 :: 		m21 = 0;
	BCF        RA2_bit+0, 2
;pic_based_car.c,81 :: 		m22 = 1;
	BSF        RA3_bit+0, 3
;pic_based_car.c,82 :: 		}
	GOTO       L_motor_control12
L_motor_control11:
;pic_based_car.c,84 :: 		else if(direction==right)
	MOVF       FARG_motor_control_direction+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_motor_control13
;pic_based_car.c,86 :: 		m11 = 0;
	BCF        RA0_bit+0, 0
;pic_based_car.c,87 :: 		m12 = 1;
	BSF        RA1_bit+0, 1
;pic_based_car.c,88 :: 		m21 = 1;
	BSF        RA2_bit+0, 2
;pic_based_car.c,89 :: 		m22 = 0;
	BCF        RA3_bit+0, 3
;pic_based_car.c,90 :: 		}
	GOTO       L_motor_control14
L_motor_control13:
;pic_based_car.c,92 :: 		else if(direction==stop)
	MOVF       FARG_motor_control_direction+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_motor_control15
;pic_based_car.c,94 :: 		m11 = 0;
	BCF        RA0_bit+0, 0
;pic_based_car.c,95 :: 		m12 = 0;
	BCF        RA1_bit+0, 1
;pic_based_car.c,96 :: 		m21 = 0;
	BCF        RA2_bit+0, 2
;pic_based_car.c,97 :: 		m22 = 0;
	BCF        RA3_bit+0, 3
;pic_based_car.c,98 :: 		}
L_motor_control15:
L_motor_control14:
L_motor_control12:
L_motor_control10:
L_motor_control8:
;pic_based_car.c,99 :: 		}
L_end_motor_control:
	RETURN
; end of _motor_control
