
#include <Adafruit_GFX.h>
#include <Adafruit_NeoMatrix.h>
#include <Adafruit_NeoPixel.h>
int PIN = 6;
String input = "";
int x = 0;

Adafruit_NeoMatrix matrix = Adafruit_NeoMatrix(8, 8, PIN,
  NEO_MATRIX_TOP     + NEO_MATRIX_RIGHT +
  NEO_MATRIX_COLUMNS + NEO_MATRIX_PROGRESSIVE,
  NEO_GRB            + NEO_KHZ800);


void setup() {
  Serial.begin(9600);
  matrix.begin();
  matrix.setTextWrap(false);
  matrix.setBrightness(255);
  matrix.setRotation(1);
 
}




void loop() {
   if (Serial.available()) {
      
      input = "";
      while (Serial.available() > 0) {
        char cc = Serial.read();
        input = input+cc;
      }
  }
  
  matrix.fillScreen(0);
  matrix.setTextColor(matrix.Color(255, 0, 0));
  matrix.setCursor(x, 0);
  matrix.print(input);
  int len = (input.length()*7)*-1;
  if(--x < len) {
    x = matrix.width();
   
   
  }
  matrix.show();
  delay(50);
}
