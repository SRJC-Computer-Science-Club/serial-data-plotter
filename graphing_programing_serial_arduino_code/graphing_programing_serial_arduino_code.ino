void setup() {
  Serial.begin(9600);
  
while (!Serial) {
  ;
}

}

void loop() {
  while (!Serial) {
  ;
}
    
     /* randNumber = random(255);
      Serial.print(randNumber);
      Serial.print(',');
      randomSeed(analogRead(1));
      randNumber = random(255);
      Serial.println(randNumber);
    
    */
    for(int i = 0; i < 255;i++)
    {
      Serial.print(i);
      Serial.print(',');
      
        Serial.print(i);
      Serial.print(',');
        Serial.print(i);
      Serial.print(',');
        Serial.print(i);
      Serial.print(',');
        Serial.print(i);
      Serial.print(',');
        Serial.print(i);
      Serial.print(',');
     // Serial.print(i*2);
     // Serial.print(',');
      Serial.println(255-i);
    }
    
    for(int i = 255; i > 0;i--)
    {
      Serial.print(i);
      Serial.print(',');
        Serial.print(i);
      Serial.print(',');
        Serial.print(i);
      Serial.print(',');
        Serial.print(i);
      Serial.print(',');
        Serial.print(i);
      Serial.print(',');
        Serial.print(i);
      Serial.print(',');
     // Serial.print(i*2);
     // Serial.print(',');
      Serial.println(255-i);
    }
    
      delay(1);                            // Wait 100 milliseconds
  
}
