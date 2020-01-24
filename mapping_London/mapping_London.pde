import processing.pdf.*;

float lat1 = 51.835;
float lon1 = -0.517;
float lat2 = 51.157;
float lon2 = 0.36;



void setup() {
  size(1200, 1000);
   //size(1200, 1000);

  background(255);
  strokeWeight(1.2);
  //printArray(PFont.list());
  PFont f  = createFont("Roboto-Bold.ttf", 6);
  textFont(f);
  fill(106, 211, 230);
  stroke(106, 211, 230);
  noStroke();
  GeoJSON river = new GeoJSON(loadJSONObject("riverThames.geojson").getJSONArray("features"), lat1, lon1, lat2, lon2, width, height, false);
  noFill();
  stroke(0);
  //new GeoJSON(loadJSONObject("londonRoads.geojson").getJSONArray("features"), lat1, lon1, lat2, lon2, width, height, false);
  
  //new GeoJSON(loadJSONObject("outer-london.geo.json").getJSONArray("features"), lat1, lon1, lat2, lon2, width, height, false);
  textSize(40);
  noFill();
  //drawPostcode boundaries
 // GeoJSON postcodeBoundaries = new GeoJSON(loadJSONObject("postCodesCropped.geojson").getJSONArray("features"), lat1, lon1, lat2, lon2, width, height, false);
  fill(0);
  //draw postcode labels
  //GeoJSON postcodeLabels = new GeoJSON(loadJSONObject("postCodesCropped.geojson").getJSONArray("features"), lat1, lon1, lat2, lon2, width, height, true);
  //drawCrimes();
  println("finished");
  //exit();
}

void draw() {
  //nothing to see here
}





void mousePressed() {
  float lat = map(mouseX, 0, height, lat1, lat2);
  float lon = map(mouseX, 0, width, lon1, lon2);
  println("float lat1 = "+lat+";");
  println("float lon1 = "+lon+";");
}

void mouseReleased() {
  float lat = map(mouseX, 0, height, lat1, lat2);
  float lon = map(mouseX, 0, width, lon1, lon2);
  println("float lat2 = "+lat+";");
  println("float lon2 = "+lon+";");
}

void drawCrimes() {
  JSONArray crime = loadJSONArray("crimes.json");
  //JSONArray crime = loadJSONObject("septStopAndSearch.json").getJSONArray("stops");

  for (int i = 0; i < crime.size(); i ++) {
    // println(crime.getJSONObject(i));
    try {
      float lat =  crime.getJSONObject(i).getFloat("Latitude");
      float lon =  crime.getJSONObject(i).getFloat("Longitude");
      //String res = crime.getJSONObject(i).getString("Outcome");
      String res = crime.getJSONObject(i).getString("Crime type");
      float y = map(lat, lat1, lat2, 0, height);
      float x = map(lon, lon1, lon2, 0, width);
      if (res.equals("Anti-social behaviour")) {
        fill(255, 0, 0);
        ellipse(x, y, 20, 20);
      } else {
        fill(0, 0, 255);
        ellipse(x, y, 20, 20);
        //text("released",x,y);
      }

      fill(0);
      //println(x);
      //ellipse(x, y, 10, 10);
    }
    catch (Exception e) {
    }
  }
}

void drawLowLevelPostcodes() {
  JSONArray postcodes = loadJSONArray("SEPostcodes.json");
  fill(0);
  for (int i = 0; i < postcodes.size(); i ++) {

    JSONObject p = postcodes.getJSONObject(i);

    try {
      float lat =  p.getFloat("lat");
      float lon =  p.getFloat("long");
      String postcode = p.getString("pcd");
      float y = map(lat, lat1, lat2, 0, width);
      float x = map(lon, lon1, lon2, 0, height);
      textSize(8);
      textAlign(CENTER, CENTER);
      text(postcode, x, y);
    }
    catch (Exception e) {
    }
  }
}
