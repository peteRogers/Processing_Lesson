import processing.video.*;
Capture video;

void setup() {
  size(800 ,600);
  video = new Capture(this,80, 60, Capture.list()[0]);
  video.start();  
  noStroke();
  smooth();
  fill(128);
}

void draw() {
  if (video.available()) {
    video.read();
    background(0);
    float brightestValue = 0; // Brightness of the brightest video pixel
    video.loadPixels();
    int index = 0;
      for (int y = 0; y < video.height; y++) {
        for (int x = 0; x < video.width; x++) {
          // Get the color stored in the pixel
          int pixelValue = video.pixels[index];
          //fill(  brightness(pixelValue));
          float dim = map(brightness(pixelValue), 0, 255, 0,11);
          ellipse(x*10, y*10, dim, dim);
          index ++;
        }
      }
  }
}
