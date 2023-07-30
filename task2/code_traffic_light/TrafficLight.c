# define red_w porta.b2
# define green_w porta.b0
# define yellow_w porta.b1

# define red_s porta.b5
# define green_s porta.b3
# define yellow_s porta.b4

# define Timer_w portc
# define Timer_s portd

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

    green_s=1;
    red_s=0;
    yellow_s=1;

    green_w=0;
    red_w=0;
    yellow_w=1;

    while(1){
        Timer_w=(t2_w*16)+t1_w;
        Timer_s=(t2_s*16)+t1_s;
        delay_ms(700);

        if(Timer_w==0x00&&red_w==1&&portb.b1==1||Timer_s==0x00&&red_s==0&&portb.b1==1){
         while(portb.b1==1){
             lable :
             if(portb.b0==1){
                if(red_s==0){
                   red_s=~red_s;
                   yellow_s=~yellow_s;
                   red_w=~red_w;

                if(yellow_w==1){
                   yellow_w=~yellow_w;}
                else{
                   green_w=~green_w;}

                t1_s=3;
                t2_s=0;
                Timer_s=(t2_s*16)+t1_s;
                delay_ms(1000);


                while(Timer_s!=0){
                  t1_s--;
                  Timer_s=(t2_s*16)+t1_s;
                  delay_ms(1000);}

                yellow_s=~yellow_s;
                green_s=~green_s;
                t1_s=2;
                t2_s=1;
                Timer_s=(t2_s*16)+t1_s;

                t1_w=2;
                t2_w=1;
                Timer_w=(t2_w*16)+t1_w;
                delay_ms(1000);

                goto lable;}

             if(red_w==1){
                red_w=~red_w;
                yellow_w=~yellow_w;
                red_s=~red_s;

                if(yellow_s==0){
                   yellow_s=~yellow_s;}
                else{
                   green_s=~green_s;}

                t1_w=3;
                t2_w=0;
                Timer_w=(t2_w*16)+t1_w;
                delay_ms(1000);

                while(Timer_w!=0){
                  t1_w--;
                  Timer_w=(t2_w*16)+t1_w;
                  delay_ms(1000);}

                yellow_w=~yellow_w;
                green_w=~green_w;
                t1_w=0;
                t2_w=2;
                Timer_w=(t2_w*16)+t1_w;

                t1_s=9;
                t2_s=1;
                Timer_s=(t2_s*16)+t1_s;
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

        if(Timer_s==0&&red_s==0){
           red_s=~red_s;
           yellow_s=~yellow_s;
           t1_s=3;
           t2_s=0;

           Timer_s=(t2_s*16)+t1_s;}

        if(Timer_s==0&&green_s==0){
           red_s=~red_s;
           green_s=~green_s;
           t1_s=3;
           t2_s=2;

           Timer_s=(t2_s*16)+t1_s;}

        if(Timer_s==0&&yellow_s==0){
           green_s=~green_s;
           yellow_s=~yellow_s;
           t2_s=1; t1_s=2;

           Timer_s=(t2_s*16)+t1_s;}



        if(Timer_w==0&&green_w==1){
           red_w=~red_w;
           green_w=~green_w;
           t2_w=1; t1_w=5;

           Timer_w=(t2_w*16)+t1_w;}

        if(Timer_w==0&&yellow_w==1){
           green_w=~green_w;
           yellow_w=~yellow_w;
           t2_w=2; t1_w=0;

           Timer_w=(t2_w*16)+t1_w;}

        if(Timer_w==0&&red_w==1){
           red_w=~red_w;
           yellow_w=~yellow_w;
           t2_w=0; t1_w=3;

           Timer_w=(t2_w*16)+t1_w;}
            }}