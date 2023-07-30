
_main:

;TrafficLight.c,18 :: 		void main(){
;TrafficLight.c,20 :: 		adcon1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;TrafficLight.c,21 :: 		trisd=0b00000000;
	CLRF       TRISD+0
;TrafficLight.c,22 :: 		trisa=0b00000000;
	CLRF       TRISA+0
;TrafficLight.c,23 :: 		trisc=0b00000000;
	CLRF       TRISC+0
;TrafficLight.c,24 :: 		trisb=0x255;
	MOVLW      85
	MOVWF      TRISB+0
;TrafficLight.c,26 :: 		green_s=1;
	BSF        PORTA+0, 3
;TrafficLight.c,27 :: 		red_s=0;
	BCF        PORTA+0, 5
;TrafficLight.c,28 :: 		yellow_s=1;
	BSF        PORTA+0, 4
;TrafficLight.c,30 :: 		green_w=0;
	BCF        PORTA+0, 0
;TrafficLight.c,31 :: 		red_w=0;
	BCF        PORTA+0, 2
;TrafficLight.c,32 :: 		yellow_w=1;
	BSF        PORTA+0, 1
;TrafficLight.c,34 :: 		while(1){
L_main0:
;TrafficLight.c,35 :: 		Timer_w=(t2_w*16)+t1_w;
	MOVF       _t2_w+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       _t1_w+0, 0
	ADDWF      R0+0, 0
	MOVWF      PORTC+0
;TrafficLight.c,36 :: 		Timer_s=(t2_s*16)+t1_s;
	MOVF       _t2_s+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       _t1_s+0, 0
	ADDWF      R0+0, 0
	MOVWF      PORTD+0
;TrafficLight.c,37 :: 		delay_ms(700);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      27
	MOVWF      R12+0
	MOVLW      39
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;TrafficLight.c,39 :: 		if(Timer_w==0x00&&red_w==1&&portb.b1==1||Timer_s==0x00&&red_s==0&&portb.b1==1){
	MOVF       PORTC+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main59
	BTFSS      PORTA+0, 2
	GOTO       L__main59
	BTFSS      PORTB+0, 1
	GOTO       L__main59
	GOTO       L__main57
L__main59:
	MOVF       PORTD+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	BTFSC      PORTA+0, 5
	GOTO       L__main58
	BTFSS      PORTB+0, 1
	GOTO       L__main58
	GOTO       L__main57
L__main58:
	GOTO       L_main9
L__main57:
;TrafficLight.c,40 :: 		while(portb.b1==1){
L_main10:
	BTFSS      PORTB+0, 1
	GOTO       L_main11
;TrafficLight.c,41 :: 		lable :
___main_lable:
;TrafficLight.c,42 :: 		if(portb.b0==1){
	BTFSS      PORTB+0, 0
	GOTO       L_main12
;TrafficLight.c,43 :: 		if(red_s==0){
	BTFSC      PORTA+0, 5
	GOTO       L_main13
;TrafficLight.c,44 :: 		red_s=~red_s;
	MOVLW      32
	XORWF      PORTA+0, 1
;TrafficLight.c,45 :: 		yellow_s=~yellow_s;
	MOVLW      16
	XORWF      PORTA+0, 1
;TrafficLight.c,46 :: 		red_w=~red_w;
	MOVLW      4
	XORWF      PORTA+0, 1
;TrafficLight.c,48 :: 		if(yellow_w==1){
	BTFSS      PORTA+0, 1
	GOTO       L_main14
;TrafficLight.c,49 :: 		yellow_w=~yellow_w;}
	MOVLW      2
	XORWF      PORTA+0, 1
	GOTO       L_main15
L_main14:
;TrafficLight.c,51 :: 		green_w=~green_w;}
	MOVLW      1
	XORWF      PORTA+0, 1
L_main15:
;TrafficLight.c,53 :: 		t1_s=3;
	MOVLW      3
	MOVWF      _t1_s+0
;TrafficLight.c,54 :: 		t2_s=0;
	CLRF       _t2_s+0
;TrafficLight.c,55 :: 		Timer_s=(t2_s*16)+t1_s;
	MOVLW      3
	MOVWF      PORTD+0
;TrafficLight.c,56 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;TrafficLight.c,59 :: 		while(Timer_s!=0){
L_main17:
	MOVF       PORTD+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main18
;TrafficLight.c,60 :: 		t1_s--;
	DECF       _t1_s+0, 1
;TrafficLight.c,61 :: 		Timer_s=(t2_s*16)+t1_s;
	MOVF       _t2_s+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       _t1_s+0, 0
	ADDWF      R0+0, 0
	MOVWF      PORTD+0
;TrafficLight.c,62 :: 		delay_ms(1000);}
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
	GOTO       L_main17
L_main18:
;TrafficLight.c,64 :: 		yellow_s=~yellow_s;
	MOVLW      16
	XORWF      PORTA+0, 1
;TrafficLight.c,65 :: 		green_s=~green_s;
	MOVLW      8
	XORWF      PORTA+0, 1
;TrafficLight.c,66 :: 		t1_s=2;
	MOVLW      2
	MOVWF      _t1_s+0
;TrafficLight.c,67 :: 		t2_s=1;
	MOVLW      1
	MOVWF      _t2_s+0
;TrafficLight.c,68 :: 		Timer_s=(t2_s*16)+t1_s;
	MOVLW      18
	MOVWF      PORTD+0
;TrafficLight.c,70 :: 		t1_w=2;
	MOVLW      2
	MOVWF      _t1_w+0
;TrafficLight.c,71 :: 		t2_w=1;
	MOVLW      1
	MOVWF      _t2_w+0
;TrafficLight.c,72 :: 		Timer_w=(t2_w*16)+t1_w;
	MOVLW      18
	MOVWF      PORTC+0
;TrafficLight.c,73 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;TrafficLight.c,75 :: 		goto lable;}
	GOTO       ___main_lable
L_main13:
;TrafficLight.c,77 :: 		if(red_w==1){
	BTFSS      PORTA+0, 2
	GOTO       L_main21
;TrafficLight.c,78 :: 		red_w=~red_w;
	MOVLW      4
	XORWF      PORTA+0, 1
;TrafficLight.c,79 :: 		yellow_w=~yellow_w;
	MOVLW      2
	XORWF      PORTA+0, 1
;TrafficLight.c,80 :: 		red_s=~red_s;
	MOVLW      32
	XORWF      PORTA+0, 1
;TrafficLight.c,82 :: 		if(yellow_s==0){
	BTFSC      PORTA+0, 4
	GOTO       L_main22
;TrafficLight.c,83 :: 		yellow_s=~yellow_s;}
	MOVLW      16
	XORWF      PORTA+0, 1
	GOTO       L_main23
L_main22:
;TrafficLight.c,85 :: 		green_s=~green_s;}
	MOVLW      8
	XORWF      PORTA+0, 1
L_main23:
;TrafficLight.c,87 :: 		t1_w=3;
	MOVLW      3
	MOVWF      _t1_w+0
;TrafficLight.c,88 :: 		t2_w=0;
	CLRF       _t2_w+0
;TrafficLight.c,89 :: 		Timer_w=(t2_w*16)+t1_w;
	MOVLW      3
	MOVWF      PORTC+0
;TrafficLight.c,90 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
;TrafficLight.c,92 :: 		while(Timer_w!=0){
L_main25:
	MOVF       PORTC+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main26
;TrafficLight.c,93 :: 		t1_w--;
	DECF       _t1_w+0, 1
;TrafficLight.c,94 :: 		Timer_w=(t2_w*16)+t1_w;
	MOVF       _t2_w+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       _t1_w+0, 0
	ADDWF      R0+0, 0
	MOVWF      PORTC+0
;TrafficLight.c,95 :: 		delay_ms(1000);}
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
	NOP
	GOTO       L_main25
L_main26:
;TrafficLight.c,97 :: 		yellow_w=~yellow_w;
	MOVLW      2
	XORWF      PORTA+0, 1
;TrafficLight.c,98 :: 		green_w=~green_w;
	MOVLW      1
	XORWF      PORTA+0, 1
;TrafficLight.c,99 :: 		t1_w=0;
	CLRF       _t1_w+0
;TrafficLight.c,100 :: 		t2_w=2;
	MOVLW      2
	MOVWF      _t2_w+0
;TrafficLight.c,101 :: 		Timer_w=(t2_w*16)+t1_w;
	MOVLW      32
	MOVWF      PORTC+0
;TrafficLight.c,103 :: 		t1_s=9;
	MOVLW      9
	MOVWF      _t1_s+0
;TrafficLight.c,104 :: 		t2_s=1;
	MOVLW      1
	MOVWF      _t2_s+0
;TrafficLight.c,105 :: 		Timer_s=(t2_s*16)+t1_s;
	MOVLW      25
	MOVWF      PORTD+0
;TrafficLight.c,106 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
	NOP
	NOP
;TrafficLight.c,108 :: 		goto lable;}}}}
	GOTO       ___main_lable
L_main21:
L_main12:
	GOTO       L_main10
L_main11:
L_main9:
;TrafficLight.c,110 :: 		if(t1_w==0){
	MOVF       _t1_w+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main29
;TrafficLight.c,111 :: 		t1_w=10;
	MOVLW      10
	MOVWF      _t1_w+0
;TrafficLight.c,113 :: 		if(t2_w!=0){
	MOVF       _t2_w+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main30
;TrafficLight.c,114 :: 		t2_w--;}}
	DECF       _t2_w+0, 1
L_main30:
L_main29:
;TrafficLight.c,116 :: 		if(t1_s==0){
	MOVF       _t1_s+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main31
;TrafficLight.c,117 :: 		t1_s=10;
	MOVLW      10
	MOVWF      _t1_s+0
;TrafficLight.c,119 :: 		if(t2_s!=0){
	MOVF       _t2_s+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main32
;TrafficLight.c,120 :: 		t2_s--;}}
	DECF       _t2_s+0, 1
L_main32:
L_main31:
;TrafficLight.c,122 :: 		t1_w--;
	DECF       _t1_w+0, 1
;TrafficLight.c,123 :: 		t1_s--;
	DECF       _t1_s+0, 1
;TrafficLight.c,125 :: 		if(Timer_s==0&&red_s==0){
	MOVF       PORTD+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main35
	BTFSC      PORTA+0, 5
	GOTO       L_main35
L__main56:
;TrafficLight.c,126 :: 		red_s=~red_s;
	MOVLW      32
	XORWF      PORTA+0, 1
;TrafficLight.c,127 :: 		yellow_s=~yellow_s;
	MOVLW      16
	XORWF      PORTA+0, 1
;TrafficLight.c,128 :: 		t1_s=3;
	MOVLW      3
	MOVWF      _t1_s+0
;TrafficLight.c,129 :: 		t2_s=0;
	CLRF       _t2_s+0
;TrafficLight.c,131 :: 		Timer_s=(t2_s*16)+t1_s;}
	MOVLW      3
	MOVWF      PORTD+0
L_main35:
;TrafficLight.c,133 :: 		if(Timer_s==0&&green_s==0){
	MOVF       PORTD+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main38
	BTFSC      PORTA+0, 3
	GOTO       L_main38
L__main55:
;TrafficLight.c,134 :: 		red_s=~red_s;
	MOVLW      32
	XORWF      PORTA+0, 1
;TrafficLight.c,135 :: 		green_s=~green_s;
	MOVLW      8
	XORWF      PORTA+0, 1
;TrafficLight.c,136 :: 		t1_s=3;
	MOVLW      3
	MOVWF      _t1_s+0
;TrafficLight.c,137 :: 		t2_s=2;
	MOVLW      2
	MOVWF      _t2_s+0
;TrafficLight.c,139 :: 		Timer_s=(t2_s*16)+t1_s;}
	MOVLW      35
	MOVWF      PORTD+0
L_main38:
;TrafficLight.c,141 :: 		if(Timer_s==0&&yellow_s==0){
	MOVF       PORTD+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main41
	BTFSC      PORTA+0, 4
	GOTO       L_main41
L__main54:
;TrafficLight.c,142 :: 		green_s=~green_s;
	MOVLW      8
	XORWF      PORTA+0, 1
;TrafficLight.c,143 :: 		yellow_s=~yellow_s;
	MOVLW      16
	XORWF      PORTA+0, 1
;TrafficLight.c,144 :: 		t2_s=1; t1_s=2;
	MOVLW      1
	MOVWF      _t2_s+0
	MOVLW      2
	MOVWF      _t1_s+0
;TrafficLight.c,146 :: 		Timer_s=(t2_s*16)+t1_s;}
	MOVLW      18
	MOVWF      PORTD+0
L_main41:
;TrafficLight.c,150 :: 		if(Timer_w==0&&green_w==1){
	MOVF       PORTC+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main44
	BTFSS      PORTA+0, 0
	GOTO       L_main44
L__main53:
;TrafficLight.c,151 :: 		red_w=~red_w;
	MOVLW      4
	XORWF      PORTA+0, 1
;TrafficLight.c,152 :: 		green_w=~green_w;
	MOVLW      1
	XORWF      PORTA+0, 1
;TrafficLight.c,153 :: 		t2_w=1; t1_w=5;
	MOVLW      1
	MOVWF      _t2_w+0
	MOVLW      5
	MOVWF      _t1_w+0
;TrafficLight.c,155 :: 		Timer_w=(t2_w*16)+t1_w;}
	MOVLW      21
	MOVWF      PORTC+0
L_main44:
;TrafficLight.c,157 :: 		if(Timer_w==0&&yellow_w==1){
	MOVF       PORTC+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main47
	BTFSS      PORTA+0, 1
	GOTO       L_main47
L__main52:
;TrafficLight.c,158 :: 		green_w=~green_w;
	MOVLW      1
	XORWF      PORTA+0, 1
;TrafficLight.c,159 :: 		yellow_w=~yellow_w;
	MOVLW      2
	XORWF      PORTA+0, 1
;TrafficLight.c,160 :: 		t2_w=2; t1_w=0;
	MOVLW      2
	MOVWF      _t2_w+0
	CLRF       _t1_w+0
;TrafficLight.c,162 :: 		Timer_w=(t2_w*16)+t1_w;}
	MOVLW      32
	MOVWF      PORTC+0
L_main47:
;TrafficLight.c,164 :: 		if(Timer_w==0&&red_w==1){
	MOVF       PORTC+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main50
	BTFSS      PORTA+0, 2
	GOTO       L_main50
L__main51:
;TrafficLight.c,165 :: 		red_w=~red_w;
	MOVLW      4
	XORWF      PORTA+0, 1
;TrafficLight.c,166 :: 		yellow_w=~yellow_w;
	MOVLW      2
	XORWF      PORTA+0, 1
;TrafficLight.c,167 :: 		t2_w=0; t1_w=3;
	CLRF       _t2_w+0
	MOVLW      3
	MOVWF      _t1_w+0
;TrafficLight.c,169 :: 		Timer_w=(t2_w*16)+t1_w;}
	MOVLW      3
	MOVWF      PORTC+0
L_main50:
;TrafficLight.c,170 :: 		}}
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
