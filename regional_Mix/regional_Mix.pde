JSONObject json;
PFont header;

void setup() {
  size(800, 600);
  
  String[] fontList = PFont.list();
  printArray(fontList);
  json = loadJSONObject("https://api.carbonintensity.org.uk/regional/postcode/SE14");
  JSONArray energyData = 
  json.getJSONArray("data").
  getJSONObject(0).
  getJSONArray("data").
  getJSONObject(0).
  getJSONArray("generationmix");
  println(energyData);
  header = createFont("Humanist-Regular", 20);
  textFont(header);
  noStroke();
  for(int i = 0; i < energyData.size(); i ++){
    println(energyData.getJSONObject(i).getString("fuel"));
    println(energyData.getJSONObject(i).getFloat("perc"));
//ellipse((i+2)*40,height/2, 50, 50);
    rect((i+1)*(width/(energyData.size()+1)), height /1.5, 10, - energyData.getJSONObject(i).getFloat("perc")*4);
    pushMatrix();
    translate((i+1)*(width/(energyData.size()+1)), height /1.5);
    rotate(radians(-90));
    textAlign(LEFT);
    text( energyData.getJSONObject(i).getString("fuel"),0,0);
    popMatrix();
  }
  //String id = json.getJSONObject("data").getJSONArray("generationmix").getJSONObject(0).getString("fuel");
  

 // println(id);
}
