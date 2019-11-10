import processing.pdf.*;

JSONArray json;
PFont header;
float px;
float py;

void setup() {
  size(800, 600);
  strokeWeight(0.05);
  json = loadJSONArray("manua_C02.json");
  println(json.size());
  float xspace = 800.0f / float(json.size());
  beginShape();
  noFill();
  for (int i = 0; i < json.size(); i ++){
      float out = map(json.getJSONObject(i).getFloat("value"), 450, 300, 0, height);
      curveVertex(i * xspace, out); 
  }
  endShape(OPEN);
  noLoop();
}


/**
  curveVertex(width, height);
  curveVertex(0, height);
  float out = map(json.getJSONObject(0).getFloat("value"), 450, 300, 0, height);
  curveVertex(0,out); 
  
  **/
  
//String cyear = json.getJSONObject(i).getString("date");
      //String y = split(cyear, '-')[0];
      //if(y.equals(year)!=true){
      //  year = y;
      //  line(i * xspace, 0, i * xspace, height);
      //  println(cyear);
      //}
