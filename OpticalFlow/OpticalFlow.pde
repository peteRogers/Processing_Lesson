import gab.opencv.*;
import processing.video.*;
import java.awt.*;

OpenCV opencv;
Capture video;

void setup() {
  size(640, 480);
  printArray(Capture.list());
  video = new Capture(this, 640/2, 480/2 ,Capture.list()[0] );
 // while (video.height == 0)  delay(2);
  opencv = new OpenCV(this, 640/2, 480/2);
  video.start();  
}

void draw() {
  background(0);
  opencv.loadImage(video);
  opencv.calculateOpticalFlow();
  image(video, 0, 0, 640, 480);
  //opencv.drawOpticalFlow();
  PVector aveFlow = opencv.getAverageFlow();
  int flowScale = 100;
  //println(aveFlow.heading());
  stroke(255);
  strokeWeight(2);
  line(width/2, height/2, width/2 + aveFlow.x*flowScale, height/2 + aveFlow.y*flowScale);
}

void captureEvent(Capture c) {
  c.read();
}
