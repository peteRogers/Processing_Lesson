import geomerative.*;
import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture video;


RShape grp;
RPoint[] points;
RPoint[] prevPoints;
int flowScale = 50;

void setup(){
 
  size(1400,768);
  video = new Capture(this, 320, 240 ,Capture.list()[0] );
  opencv = new OpenCV(this, 320, 240);
  background(255);
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("0X0X0X0X0", "Roboto-Bold.ttf", 200, CENTER);

  // Enable smoothing
  smooth();
  video.start();
  noFill();
  strokeWeight(0.5);
  stroke(0,0,0);
}

void draw(){
  background(255);
  opencv.loadImage(video);
  opencv.calculateOpticalFlow();
  // Set the origin to draw in the middle of the sketch
  translate(width/2, 3*height/4);
  RG.setPolygonizer(RG.ADAPTATIVE);
  grp.draw(); // draw the text as an outline
 // Get the points on the curve's shape
 // RG.setPolygonizer(RG.UNIFORMSTEP);
 // RG.setPolygonizerStep(random(5, 20)); 
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(random(2, 30));
  RG.setPolygonizerLength(5);
  points = grp.getPoints();
  PVector aveFlow = opencv.getAverageFlow();
  // If there are any points
  if(points != null){
    noFill();
    stroke(255,0,0, 50);
    for(int i=0; i<points.length; i++){
        line(points[i].x, points[i].y, points[i].x + (aveFlow.x*flowScale) , points[i].y + (aveFlow.y*flowScale));
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}
