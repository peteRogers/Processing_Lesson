import geomerative.*;
RShape grp;
RPoint[] points;

void setup(){
 
  size(1400,768);
  background(255);
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("PROCESSING", "Roboto-Bold.ttf", 200, CENTER);
  // Enable smoothing
  smooth();
   noFill();
  strokeWeight(0.5);
  stroke(0,0,0,80);
}

void draw(){
  // Clean frame
  //background(255);
   fill(255, 255, 255, 20);
   rect(0,0,width, height);
  // Set the origin to draw in the middle of the sketch
  translate(width/2, 3*height/4);
  
  // Draw the group of shapes
 
  RG.setPolygonizer(RG.ADAPTATIVE);
  noFill();
  grp.draw();
  
  // Get the points on the curve's shape
 // RG.setPolygonizer(RG.UNIFORMSTEP);
 // RG.setPolygonizerStep(random(5, 20));
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(random(10, 30));
  points = grp.getPoints();
  
  // If there are any points
  if(points != null){
    
    for(int i=0; i<points.length; i++){
      pushMatrix();
      translate(points[i].x, points[i].y);
      rotate(radians(random(0, 360)));
      float r = random(0, 800);
      line(-(r/2), 0, r/2, 0);
      popMatrix();
    }
  }
}
