#define HWSERIAL Serial1
void setup() {
  
  Serial.begin(9600 ); 
  HWSERIAL.begin(9600 );
  while (!Serial)
    {}
    delay(1000);
    Serial.println("setup done`setupdone`setupdone`setupdone");
    
}
int pos1=0, pos2=0;
char incomingBytesFromVB[1000];
        char incomingBytesFromTeensy[1000];
        
void loop() {
        int incomingByte;
        
        
  if (Serial.available() > 0) {
    incomingByte = Serial.read();
    
    incomingBytesFromVB[pos1++] = incomingByte;
   // HWSERIAL.print(incomingByte);
    if (incomingByte == 13) //when meet delimiter
    {
        incomingBytesFromVB[pos1]='\0';
        pos1 = 0;
      //  HWSERIAL.println(" ");
        HWSERIAL.println(incomingBytesFromVB);
        
              
        
      
    
    }
  
  }
  if (HWSERIAL.available() > 0) {
    incomingByte = HWSERIAL.read();
    incomingBytesFromTeensy[pos2++] = incomingByte;
    if (incomingByte == 13) //when meet delimiter
    {
        incomingBytesFromTeensy[pos2]='\0';
        pos2 = 0;
        
        Serial.println(incomingBytesFromTeensy);
        
      
    }
    
  }
}
 
