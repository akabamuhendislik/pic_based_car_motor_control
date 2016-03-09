#line 1 "C:/Users/user/WEBSÝTE/L293D_PIC/MikroC/pic_based_car.c"
#line 22 "C:/Users/user/WEBSÝTE/L293D_PIC/MikroC/pic_based_car.c"
void mcu_init(void);
void motor_control(char directions);


void main ()
{
 mcu_init();

 while(1)
 {
 motor_control( 1 );
 delay_ms(500);
 motor_control( 4 );
 delay_ms(100);
 motor_control( 1 );
 delay_ms(500);
 motor_control( 3 );
 delay_ms(100);
 motor_control( 2 );
 delay_ms(500);
 motor_control( 5 );
 }

}


void mcu_init(void)
{
portb = 0;
porta = 0;
cmcon = 0x07;
trisa = 0x00;
}


void motor_control (char direction)
{

 if(direction== 1 )
 {
  RA0_bit  = 1;
  RA1_bit  = 0;
  RA2_bit  = 1;
  RA3_bit  = 0;
 }

 else if(direction== 2 )
 {
  RA0_bit  = 0;
  RA1_bit  = 1;
  RA2_bit  = 0;
  RA3_bit  = 1;
 }

 else if(direction== 3 )
 {
  RA0_bit  = 1;
  RA1_bit  = 0;
  RA2_bit  = 0;
  RA3_bit  = 1;
 }

 else if(direction== 4 )
 {
  RA0_bit  = 0;
  RA1_bit  = 1;
  RA2_bit  = 1;
  RA3_bit  = 0;
 }

 else if(direction== 5 )
 {
  RA0_bit  = 0;
  RA1_bit  = 0;
  RA2_bit  = 0;
  RA3_bit  = 0;
 }
}
