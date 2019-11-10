

void setup() {
  Serial.begin(115200);
  pinMode(13, OUTPUT);
}

void loop() {
  int sensor = analogRead(A0);
  int sensor1 = analogRead(A1);
  Serial.print(sensor);
  Serial.print('>');
  Serial.print(sensor1);
  Serial.print('>');
  Serial.print('<');
  delay(1);
}


//receiving serial messages
void serialEvent() {
  if(Serial.available()){
      String input = Serial.readStringUntil('<');
      int button = getValue(input, '>', 0).toInt();
      if(button == 1){
        digitalWrite(13, LOW);
      }else{
        digitalWrite(13, HIGH);
    }   
  }
}
