#define HWSERIAL Serial1

#include <stdlib.h>
long randNumber1,randNumber2;
void setup() {
  Serial.begin(9600 ); 
 
  // put your setup code here, to run once:
 HWSERIAL.begin(9600 );
  while (!Serial)
  {}
  delay(1000);
    HWSERIAL.println("Teensy no Com`Teensy no Com`Teensyno Com");
    
    randomSeed(analogRead(0));
    
}

char incomingBytes[1000];
  int pos = 0;
  int count =0;
void loop() {
count++;
int incomingByte;
 char string1[1000]="Teensyduino without COM port";
  char string2[100]="Congratulations!";
  char string3[20];
if (count % 100 == 0)
{
  
  strcat(string1, "`");
  strcat(string1, string2);
  strcat(string1, "`");
  for (int i=0;i<20;i++)
  {
    randNumber1 = random(-10000, 10000);
    dtostrf(randNumber1, 4, 6, string3);
    strcat(string1, string3);
    strcat(string1, "\n");
  }
  
  count = 0;
  
}
  if (HWSERIAL.available() >0){
    incomingByte = HWSERIAL.read();
    incomingBytes[pos++] = incomingByte;
    if (incomingByte == 13)
    {
      incomingBytes[pos] = '\0';
      
      pos = 0;
      
      Serial.println(incomingBytes);
    }
    if (count %100 ==0)
    {
      
      
      HWSERIAL.println(string1);
      count = 0;
      
    }
  }
 
  

}
