class GeoJSON {


  public GeoJSON(JSONArray features, float lat1, float lon1, float lat2, float lon2, int w, int h, boolean label) {
    for (int i = 0; i < features.size(); i ++) {
      //println(features.size()-i);
      String name = features.getJSONObject(i).getJSONObject("properties").getString("name");
      JSONArray polys = features.getJSONObject(i).getJSONObject("geometry").getJSONArray("coordinates");
      if (features.getJSONObject(i).getJSONObject("geometry").getString("type").equals("Polygon")) {
        PShape sha = createShape();
        sha.beginShape();
        for (int p = 0; p < polys.size(); p ++) {
          for (int pp = 0; pp < polys.getJSONArray(p).size(); pp++) {
            JSONArray a =  polys.getJSONArray(p).getJSONArray(pp);
            float y = map(a.getFloat(1), lat1, lat2, 0, h);
            float x = map(a.getFloat(0), lon1, lon2, 0, w);
            sha.vertex(x, y);
          }
        }
        sha.endShape();
        shape(sha);
      }
      if (features.getJSONObject(i).getJSONObject("geometry").getString("type").equals("Point")) {
        println(features.getJSONObject(i).getJSONObject("geometry").getJSONArray("coordinates"));

        float y = map(features.getJSONObject(i).getJSONObject("geometry").getJSONArray("coordinates").getFloat(1), lat1, lat2, 0, h);
        float x = map(features.getJSONObject(i).getJSONObject("geometry").getJSONArray("coordinates").getFloat(0), lon1, lon2, 0, w);
        fill(50, 180, 50, 150);
        stroke(0, 0, 0);
        strokeWeight(2);
        ellipse(x, y, 10, 10);
        /*
            float triHeight = map(elev, 0, 1000, 0, 80);
         triangle(x-(triHeight/2),y, x, y-(triHeight), x+(triHeight/2), y );
         textSize(32);
         textAlign(LEFT);
         fill(0);
         pushMatrix();
         translate(x, (y-triHeight)-5);
         rotate(radians(315));
         text(peakName, 0, 0);
         popMatrix();
         */
      }


      if (features.getJSONObject(i).getJSONObject("geometry").getString("type").equals("LineString")) {
        strokeWeight(lineWeightFromFeature(features.getJSONObject(i).getJSONObject("properties").getString("function")));
        PShape sha = createShape();
        sha.beginShape();
        for (int p = 0; p < polys.size(); p ++) {

          float y = map(polys.getJSONArray(p).getFloat(1), lat1, lat2, 0, h);
          float x = map(polys.getJSONArray(p).getFloat(0), lon1, lon2, 0, w);
          sha.vertex(x, y);
        }
        sha.endShape();
        shape(sha);
      }

      if (features.getJSONObject(i).getJSONObject("geometry").getString("type").equals("MultiPolygon")) {
        float xav = 0;
        float yav = 0;
        int counter = 0;
        for (int p = 0; p < polys.size(); p ++) {
          JSONArray mp = polys.getJSONArray(p);
          for (int pp = 0; pp < mp.size(); pp++) {

            PShape sha = createShape();
            sha.beginShape();
            JSONArray a =  mp.getJSONArray(pp);
            //println(a.size());
            for (int aa = 0; aa < a.size(); aa++) {
              float y = map(a.getJSONArray(aa).getFloat(1), lat1, lat2, 0, h);
              float x = map(a.getJSONArray(aa).getFloat(0), lon1, lon2, 0, w);
              sha.vertex(x, y);
              xav = xav + x;
              yav = yav + y;
              counter ++;
              // println(x);
            }
            sha.endShape();
            if (label == false) {
              shape(sha);
            }
          }
        }

        if (label == true) {
          xav = xav / counter;
          yav = yav / counter;
          fill(0);
          textAlign(CENTER, CENTER);
          text(name, xav, yav);
        }
      }
    }
  }

  float lineWeightFromFeature(String name) {
    try {

      if (name.equals("Motorway")) {
        return 10.0;
      }
      if (name.equals("A Road")) {
        return 7;
      }
      if (name.equals("B Road")) {
        return 5;
      }
      if (name.equals("Minor Road")) {
        return 3;
      }
      if (name.equals("Local Road")) {
        return 2;
      }
      if (name.equals("Local Access Road")) {
        return 1;
      }
      if (name.equals("Restricted Local Access Road")) {
        return 0.5;
      }
      if (name.equals("Secondary Access Road")) {
        return 0.25;
      }
    }
    catch(Exception e) {
    }


    return 0;
  }
}
