import processing.video.*;
Capture video;

void setup() {
  size(800 ,600);
  printArray(Capture.list());
  video = new Capture(this,80, 60, Capture.list()[0]);
  video.start();  
  noStroke();
  fill(255);
}

void draw() {
  
    background(0);
    
    video.loadPixels();
    int index = 0;
      for (int y = 0; y < video.height; y++) {
        for (int x = 0; x < video.width; x++) {
          // Get the color stored in the pixel
          int pixelValue = video.pixels[index];
          
          float dim = map(brightness(pixelValue), 0, 255, 0,10);
          ellipse(x*10, y*10, dim, dim);
          index ++;
        }
      }
 }
 void captureEvent(Capture c) {
  c.read();
}
