/* Example 3.9 of Dan Shiffman's Nature of Code */

float startAngle = 0;
float angleVel = 0.1;

void setup() {
  size(640,360);
}

void draw() {
  background(255);

  // startAngle keeps track of how quickly the wave seems to be moving through the screen
  // from one frame to the next
  startAngle += 0.2;
  
  // angle (and angleVel), in contrast, are about how many periods we see drawn in a static screen
  
  // outside the loop, angle is initialised to startAngle's value
  float angle = startAngle;
  
 for (int x = 0; x <= width; x += 24) {
    float y = map(sin(angle),-1,1,0,height);
    stroke(0);
    fill(0,50);
    strokeWeight(2);
    ellipse(x,y,48,48);
    
    // each loop iteration, it increments by angleVel
    angle += angleVel;
  } 

}