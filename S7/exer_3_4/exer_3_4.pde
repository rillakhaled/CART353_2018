/* Rilla's solution for exercise 3.4 in Daniel Shiffman's The Nature of Code 
 and based on Shiffman's code for example 3.4
 
 Exercise 3.4
 Using Example 3.4 as a basis, draw a spiral path. Start in the center and move outwards. 
 Note that this can be done by only changing one line of code and adding one line of code! */


// set our radius - r - to be very small 
// this is the only line of code we need to change
float r = 1;

// our angle starts at 0
float theta = 0;

void setup() {
  size(640, 360);
  background(255);
}

void draw() {

  // work out our x and y coords for drawing a new ellipse
  float x = r * cos(theta);
  float y = r * sin(theta);

  noStroke();
  fill(0);

  // draw an ellipse there
  ellipse(x+width/2, y+height/2, 16, 16);

  // increase our angle a small amount (clockwise)
  theta += 0.01;

  // increase our r value by a small amount - this creates the "growing" effect each frame
  // this is the only line of code we need to add
  r += 0.05;
}