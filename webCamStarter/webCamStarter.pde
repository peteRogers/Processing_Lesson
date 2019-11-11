import processing.video.*;
Capture video;


void setup() {
  size(800 ,600);
  printArray(Capture.list());
  video = new Capture(this,800, 600, Capture.list()[0]);
  video.start();  
}

void draw() {
    image(video, 0, 0);
 }
 
 
 void captureEvent(Capture c) {
  c.read();
}
