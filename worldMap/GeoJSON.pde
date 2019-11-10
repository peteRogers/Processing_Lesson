class GeoJSON{
  
  
  public GeoJSON(JSONArray features, float lat1, float lat2, float lng1, float lng2, int w, int h){
      
  println(features.size());
  for(int i = 0; i < features.size(); i ++){
    String name = features.getJSONObject(i).getJSONObject("properties").getString("ADMIN");
    //println(name);
   
    noFill();
   // fill(random(0, 255),random(0, 255),random(0, 255)); 
    JSONArray polys = features.getJSONObject(i).getJSONObject("geometry").getJSONArray("coordinates");
   // println(polys.size());
    if(features.getJSONObject(i).getJSONObject("geometry").getString("type").equals("Polygon")){
       PShape sha = createShape();
       sha.beginShape();
      for(int p = 0; p < polys.size(); p ++){
       
         for(int pp = 0; pp < polys.getJSONArray(p).size(); pp++){
             JSONArray a =  polys.getJSONArray(p).getJSONArray(pp);
           
             float y = map(a.getFloat(1), lat1, lat2, 0, h);
             float x = map(a.getFloat(0), lng1, lng2, 0, w);
//println(x+" "+y+" "+a.getFloat(0));
             //curveVertex(x, y);
             sha.vertex(x, y);
             }
             
          }
         sha.endShape();
         shape(sha);
        
      }
      
      if(features.getJSONObject(i).getJSONObject("geometry").getString("type").equals("MultiPolygon")){
        for(int p = 0; p < polys.size(); p ++){
          JSONArray mp = polys.getJSONArray(p);
          
          //println(p);
//println(mp.size());
          
         
          
          for(int pp = 0; pp < mp.size(); pp++){
           
             PShape sha = createShape();
             sha.beginShape();
             JSONArray a =  mp.getJSONArray(pp);
             println(a.size());
             for(int aa = 0; aa < a.size(); aa++){
                 float y = map(a.getJSONArray(aa).getFloat(1), lat1, lat2, 0,h);
                 float x = map(a.getJSONArray(aa).getFloat(0), lng1,lng2, 0, w);
             //println(x+" "+y+" "+a.getFloat(0));
                 sha.vertex(x, y);
          
               
             }
             //println(a);
            // println(" :: ");
             sha.endShape();
             shape(sha);
          }
             
         
             
          }
        
      }
    
  }
  
  }
  
}
