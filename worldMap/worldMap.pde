import processing.pdf.*;

JSONObject lewishamMap, worldMap;
JSONArray crime;

int w = 1200;
int h = 600;

void setup(){
  size(1200, 600);
  stroke(0.1);
  worldMap = loadJSONObject("countries.geo.json");
  JSONArray features = worldMap.getJSONArray("features");
  new GeoJSON(features, 90,-90, -180,180, w, h);
}
