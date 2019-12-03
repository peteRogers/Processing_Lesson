import geomerative.*;
import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture video;

float spring = 0.05;
float gravity = 0.9;
float friction = -1;
ArrayList<Ball> balls = new ArrayList();

void setup() {
  size(1280, 960);
  noStroke();
  fill(255, 204);
  video = new Capture(this, 160, 120 ,Capture.list()[0] );
  opencv = new OpenCV(this, 160, 120);
  video.start();
}

void draw() {
  background(0);
  opencv.loadImage(video);
  opencv.calculateOpticalFlow();
  //opencv.
  
  PVector aveFlow = opencv.getAverageFlow();
  
  image(video, 0, 0);
  /**
  for (int i = 0; i < balls.size(); i++) {
       Ball b = balls.get(i);
       for(int ii = i; ii < balls.size(); ii ++){
          float dx = balls.get(ii).x - b.x;
          float dy = balls.get(ii).y - b.y;
          float distance = sqrt(dx*dx + dy*dy);
          float minDist = balls.get(ii).diameter/2 + b.diameter/2;
           if (distance < minDist) { 
            float angle = atan2(dy, dx);
            float targetX = b.x + cos(angle) * minDist;
            float targetY = b.y + sin(angle) * minDist;
            float ax = (targetX - balls.get(ii).x) * spring;
            float ay = (targetY - balls.get(ii).y) * spring;
            b.vx -= ax;
            b.vy -= ay;
            balls.get(ii).vx += ax;
            balls.get(ii).vy += ay;
         }
      }
   } 
   **/
   //println(aveFlow.x);
   if(abs(aveFlow.x) > 1){
     if(aveFlow.x < 0){
       Ball b = new Ball(width, height/2, random(20, 70));
       b.vx = (aveFlow.x *30);
       balls.add(b);
     }else{
       
       Ball b = new Ball(0, height/2, random(20, 70));
       b.vx = (aveFlow.x *30);
       balls.add(b);
     }
      
   }
   for(int i = 0; i < balls.size(); i++){
     balls.get(i).vy = balls.get(i).vy + ((aveFlow.y *5) );
     balls.get(i).move();
     balls.get(i).display();
   }
}

void captureEvent(Capture c) {
  c.read();
}

 void mouseReleased(){
      balls.add(new Ball(mouseX, mouseY, random(30, 70)));
 }
