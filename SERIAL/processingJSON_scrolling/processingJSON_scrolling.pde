JSONArray json;
import processing.serial.*;
Serial myPort; 
String string = "";



void setup(){
  size(1024, 1024);
  printArray(Serial.list());
  
  myPort = new Serial(this, Serial.list()[3], 9600);


}

void keyPressed(){
  string = string + key;
  myPort.write(string);
}







void draw(){
 background(0);
 fill(255);
 text(string,100, 100);
}

void mousePressed(){
  string = "";
}

//json = loadJSONObject("http://api.open-notify.org/astros.json").getJSONArray("people");
//  for(int i = 0; i < json.size();i++){
//    println(json.getJSONObject(i).getString("name"));
//    myPort.write(json.getJSONObject(i).getString("name"));
//  }
