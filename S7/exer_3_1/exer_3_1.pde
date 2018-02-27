/* Rilla's solution for exercise 3.1 in Daniel Shiffman's The Nature of Code 

Exercise 3.1
Rotate a baton-like object (see below) around its center using 
translate() and rotate(). */

PVector b1;
PVector b2;

float angleDegrees;

void setup() {
  
  size(300, 300);
  background(255);
  
  // these 2 vectors hold x, y pairs for the 2 ends of our baton
  b1 = new PVector(-50, 0);
  b2 = new PVector(50, 0);
  
  // the angle will be in degrees
  angleDegrees = 0;
}

void draw() {
  // wipe the slate clean
  background(255);
  
  // set point of origin to middle of the screen
  translate(150, 150);
  
  // slightly increase our angle in degrees
  angleDegrees += 1.5;
  
  // convert it to radians
  float angleRadians = radians(angleDegrees);
  
  // rotate (on the z axis) by this amount - NB Processing's rotate method assumes radians as input
  rotate(angleRadians);
  
  strokeWeight(2);
  
  // draw a line between the points specified in our vectors
  line(b1.x, b1.y, b2.x, b2.y);
  fill(0);
  
  // draw a circle at the point represented by each vector
  ellipse(b1.x, b1.y, 10, 10);
  ellipse(b2.x, b2.y, 10, 10);
}