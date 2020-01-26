JSONArray json;
import processing.serial.*;
Serial myPort; 



void setup(){
  size(1024, 1024);
  printArray(Serial.list());
  
    myPort = new Serial(this, Serial.list()[3], 115200);

  json = loadJSONObject("http://api.open-notify.org/astros.json").getJSONArray("people");
  for(int i = 0; i < json.size();i++){
    println(json.getJSONObject(i).getString("name"));
    myPort.write(json.getJSONObject(i).getString("name"));
  }
 
 

}



void draw(){
 
}
