float theta;   
void setup() {
 size(800, 600);
  smooth();
  strokeWeight(20f);
}

void draw() {
  background(0);
  
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = ((mouseX / (float) width) * 180f)-90f;
  // Convert it to radians
  println(a);
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 60 pixels
  //line(0,0,0,-200);
  // Move to the end of that line
  translate(0,-60);
  // Start the recursive branching!
  branch(100);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.8f;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    strokeWeight(h/8);
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0,0,0,-h);  // Draw the branch
    translate(0,-h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

  }
}
