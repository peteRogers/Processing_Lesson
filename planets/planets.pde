import processing.pdf.*;



void setup(){
  background(0);
  size(10000, 6000, PDF, "planet.pdf");
  JSONArray j = loadJSONArray("planet.json"); 
  for(int i = 0; i < j.size(); i++){
      println(j.getJSONObject(i).getString("planet"));
      float diam = j.getJSONObject(i).getFloat("diameter") / 1000;
      ellipse(map(j.getJSONObject(i).getFloat("distanceFromSun"),0, 5906, 0, width), height/2, diam, diam);
      
  }
  
  exit();
}
