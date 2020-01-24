JSONObject json;
PFont header;

void setup() {
  size(800, 600);
  
  String[] fontList = PFont.list();
  //printArray(fontList);
  json = loadJSONObject("https://api.carbonintensity.org.uk/generation");
  JSONArray energyData = json.getJSONObject("data").getJSONArray("generationmix");
  header = createFont("Humanist-Regular", 20);
  textFont(header);
  for(int i = 0; i < energyData.size(); i ++){
    println(energyData.getJSONObject(i).getString("fuel"));
    println(energyData.getJSONObject(i).getFloat("perc"));
    ellipse((i+2)*40,height/4, 50, energyData.getJSONObject(i).getFloat("perc")*2);
    pushMatrix();
    translate((i+2)*40, height /3);
    rotate(radians(-90));
    textAlign(LEFT);
    text( energyData.getJSONObject(i).getString("fuel"),0,0);
    popMatrix();
  }
  String id = json.getJSONObject("data").getJSONArray("generationmix").getJSONObject(0).getString("fuel");
  

  println(id);
}
