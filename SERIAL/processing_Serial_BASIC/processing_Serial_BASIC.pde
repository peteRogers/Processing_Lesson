import processing.serial.*;
Serial myPort; 
int sensor = 0;


void setup(){
  size(1024, 1024);
   printArray(Serial.list());
   myPort = new Serial(this, Serial.list()[3], 115200);

}



void draw(){
  background(0);
  fill(255,255,255, 50);
  ellipse(width/2, height/2, sensor, sensor);

}


void serialEvent (Serial p){
   String inString = p.readStringUntil('<');
   if (inString != null) {
      inString = trim(inString);
      String[] sensorArray = split(inString, '>');
      sensor = int(sensorArray[0]);
   }
}


//mouse events
void mouseReleased(){
 
  myPort.write('1');
  myPort.write('>');
  myPort.write('<');
}

void mousePressed(){
 
  myPort.write('0');
  myPort.write('>');
  myPort.write('<');
}
