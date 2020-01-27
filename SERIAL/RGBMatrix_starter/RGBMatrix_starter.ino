#include <Adafruit_GFX.h>
#include <Adafruit_NeoMatrix.h>
#include <Adafruit_NeoPixel.h>

int counter = 9;
int PIN = 6;

Adafruit_NeoMatrix matrix = Adafruit_NeoMatrix(8, 8, PIN, NEO_MATRIX_TOP + NEO_MATRIX_RIGHT + NEO_MATRIX_COLUMNS + NEO_MATRIX_PROGRESSIVE, NEO_GRB + NEO_KHZ800);

void setup() {
  matrix.begin();
  matrix.setBrightness(255);
  matrix.setRotation(1);
}



void loop() {
  matrix.clear();
  matrix.setCursor(2, 0);
 
  matrix.drawPixel(0, 0, matrix.Color(0, 255, 0));
  matrix.print(counter);
  
  matrix.show();
  delay(1000);
  counter --;
  if(counter < 0){

    counter = 9;
  }
}
