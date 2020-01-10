import processing.video.*;

Capture video;
int x = 0;
int y = 0;

void setup() {
  size(1000, 500);
  printArray(Capture.list());
  video = new Capture(this, 100, 50, Capture.list()[0]);
  video.start();  
}

void draw() {

  // background(0);
  if (video.available()) {
    video.read();
    x = x + video.width;
    if (x > width) {
      x = 0; 
      y = y + video.height;
    }
    if (y > height) {
      y = 0;
    }
    image(video, x, y);
  }
}

/**
 void captureEvent(Capture c) {
 c.read();
 
 }
**/
