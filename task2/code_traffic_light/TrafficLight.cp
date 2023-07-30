#line 1 "D:/traffic_light/code/TrafficLight.c"
#line 12 "D:/traffic_light/code/TrafficLight.c"
unsigned short t1_w=3;
unsigned short t2_w=0;

unsigned short t1_s=3;
unsigned short t2_s=2;

void main(){

 adcon1=7;
 trisd=0b00000000;
 trisa=0b00000000;
 trisc=0b00000000;
 trisb=0x255;

  porta.b3 =1;
  porta.b5 =0;
  porta.b4 =1;

  porta.b0 =0;
  porta.b2 =0;
  porta.b1 =1;

 while(1){
  portc =(t2_w*16)+t1_w;
  portd =(t2_s*16)+t1_s;
 delay_ms(700);

 if( portc ==0x00&& porta.b2 ==1&&portb.b1==1|| portd ==0x00&& porta.b5 ==0&&portb.b1==1){
 while(portb.b1==1){
 lable :
 if(portb.b0==1){
 if( porta.b5 ==0){
  porta.b5 =~ porta.b5 ;
  porta.b4 =~ porta.b4 ;
  porta.b2 =~ porta.b2 ;

 if( porta.b1 ==1){
  porta.b1 =~ porta.b1 ;}
 else{
  porta.b0 =~ porta.b0 ;}

 t1_s=3;
 t2_s=0;
  portd =(t2_s*16)+t1_s;
 delay_ms(1000);


 while( portd !=0){
 t1_s--;
  portd =(t2_s*16)+t1_s;
 delay_ms(1000);}

  porta.b4 =~ porta.b4 ;
  porta.b3 =~ porta.b3 ;
 t1_s=2;
 t2_s=1;
  portd =(t2_s*16)+t1_s;

 t1_w=2;
 t2_w=1;
  portc =(t2_w*16)+t1_w;
 delay_ms(1000);

 goto lable;}

 if( porta.b2 ==1){
  porta.b2 =~ porta.b2 ;
  porta.b1 =~ porta.b1 ;
  porta.b5 =~ porta.b5 ;

 if( porta.b4 ==0){
  porta.b4 =~ porta.b4 ;}
 else{
  porta.b3 =~ porta.b3 ;}

 t1_w=3;
 t2_w=0;
  portc =(t2_w*16)+t1_w;
 delay_ms(1000);

 while( portc !=0){
 t1_w--;
  portc =(t2_w*16)+t1_w;
 delay_ms(1000);}

  porta.b1 =~ porta.b1 ;
  porta.b0 =~ porta.b0 ;
 t1_w=0;
 t2_w=2;
  portc =(t2_w*16)+t1_w;

 t1_s=9;
 t2_s=1;
  portd =(t2_s*16)+t1_s;
 delay_ms(1000);

 goto lable;}}}}

 if(t1_w==0){
 t1_w=10;

 if(t2_w!=0){
 t2_w--;}}

 if(t1_s==0){
 t1_s=10;

 if(t2_s!=0){
 t2_s--;}}

 t1_w--;
 t1_s--;

 if( portd ==0&& porta.b5 ==0){
  porta.b5 =~ porta.b5 ;
  porta.b4 =~ porta.b4 ;
 t1_s=3;
 t2_s=0;

  portd =(t2_s*16)+t1_s;}

 if( portd ==0&& porta.b3 ==0){
  porta.b5 =~ porta.b5 ;
  porta.b3 =~ porta.b3 ;
 t1_s=3;
 t2_s=2;

  portd =(t2_s*16)+t1_s;}

 if( portd ==0&& porta.b4 ==0){
  porta.b3 =~ porta.b3 ;
  porta.b4 =~ porta.b4 ;
 t2_s=1; t1_s=2;

  portd =(t2_s*16)+t1_s;}



 if( portc ==0&& porta.b0 ==1){
  porta.b2 =~ porta.b2 ;
  porta.b0 =~ porta.b0 ;
 t2_w=1; t1_w=5;

  portc =(t2_w*16)+t1_w;}

 if( portc ==0&& porta.b1 ==1){
  porta.b0 =~ porta.b0 ;
  porta.b1 =~ porta.b1 ;
 t2_w=2; t1_w=0;

  portc =(t2_w*16)+t1_w;}

 if( portc ==0&& porta.b2 ==1){
  porta.b2 =~ porta.b2 ;
  porta.b1 =~ porta.b1 ;
 t2_w=0; t1_w=3;

  portc =(t2_w*16)+t1_w;}
 }}
