/* PIC Based L293D Controlled Car       */
/* Motor Control Functions              */
/* akabamuhendislik.com                 */
/* Author : Aziz KABA                   */
/* Updated: 09/03/2016                  */
/* for info: akabamuhendislik@gmail.com */
/* TURKEY                               */


#define m11 RA0_bit
#define m12 RA1_bit
#define m21 RA2_bit
#define m22 RA3_bit


#define  forward 1
#define backward 2
#define left     3
#define right    4
#define stop     5

void mcu_init(void);
void motor_control(char directions);

/***********************ANA FONKSÝYON BLOÐU (MAIN)********************************/
void main ()
{
       mcu_init();
       
       while(1)
                  {
                       motor_control(forward);
                       delay_ms(500);
                       motor_control(right);
                       delay_ms(100);
                       motor_control(forward);
                       delay_ms(500);
                       motor_control(left);
                       delay_ms(100);
                       motor_control(backward);
                       delay_ms(500);
                       motor_control(stop);
                  }
       
}

/***********************MCU ÝLK AYAR FONKSÝYONU********************************/
void mcu_init(void)
{
portb = 0;      // portb yi sýfýrla
porta = 0;      // porta yý sýfýrla
cmcon = 0x07;   // Analog Komparatör ler kapalý
trisa = 0x00;      // hepsi çýkýþ all output
}

/***********************MOTOR KONTROL FONKSÝYONU*******************************/
void motor_control (char direction)
{

     if(direction==forward)
      {
        m11 = 1;
          m12 = 0;
          m21 = 1;
        m22 = 0;
      }

    else if(direction==backward)
      {
        m11 = 0;
           m12 = 1;
           m21 = 0;
        m22 = 1;
      }

     else if(direction==left)
      {
          m11 = 1;
            m12 = 0;
            m21 = 0;
          m22 = 1;
      }
      
      else if(direction==right)
      {
          m11 = 0;
            m12 = 1;
            m21 = 1;
          m22 = 0;
      }
      
     else if(direction==stop)
      {
          m11 = 0;
            m12 = 0;
            m21 = 0;
          m22 = 0;
      }
}