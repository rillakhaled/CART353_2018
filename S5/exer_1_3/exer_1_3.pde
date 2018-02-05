/* Rilla's solution to exercise 1.3 in Daniel Shiffman's Nature of Code
 
 Exercise 1.3
 Extend the bouncing ball with vectors example into 3D. Can you get a sphere to bounce around a box? */

// PVectors for location and velocity
PVector location;
PVector velocity;

float boxSize; // length of our box (it is a cube)
float sphereR; // radius of our ball
float theta; // degree to rotate our view by

void setup() {
  size(600, 400, P3D);
  boxSize = 150;
  sphereR = 20;
  location = new PVector(width/2, height/2, boxSize/2);
  velocity = new PVector(1, 1, 2);
  theta = 0.0;
}

void draw() {
  background(255);

  pushMatrix();
  // set our point of origin to middle of screen 
  translate(width/2, height/2, boxSize/2);

  // rotate our view
  rotateY(theta);

  // draw a cube with no fill
  noFill();
  box(boxSize);
  popMatrix();

  // update the location vector (which will be applied to ball)
  location.add(velocity);

  // if the location of the ball's right is more than the right side of the box
  if ((location.x + sphereR) > width/2+boxSize/2) {
    // change the direction of horiz velocity
    velocity.x = velocity.x * -1;
    // set the horiz location to be the maximum it can be inside the box
    location.x = width/2+boxSize/2 - sphereR;
  } 
  
  // else if the location of the ball's left is less than the left side of the box
  else if ((location.x - sphereR) < width/2-boxSize/2) {
    // change the direction of horiz velocity
    velocity.x = velocity.x * -1;
    // set the horiz location to be the minimum it can be inside the box
    location.x = width/2-boxSize/2 + sphereR;
  }
  
  // if the location of the ball's base is lower than the bottom of the box
  if ((location.y + sphereR) > height/2+boxSize/2) {
    // change the direction of vert velocity
    velocity.y = velocity.y * -1;
    // set y location to fit within box
    location.y = height/2 + boxSize/2 - sphereR;
  } 
  
  // else if the location of the ball's top is higher than the top of the box
  else if ((location.y - sphereR) < height/2-boxSize/2) {
    // change the direction of vert velocity
    velocity.y = velocity.y * -1;
    // set y location to fit within box
    location.y = height/2 - boxSize/2 + sphereR;
  }
  
  
  // if the location of the ball's front sticks out beyond the front of the box
  if ((location.z + sphereR) > boxSize) {
    // change the direction of forwards/backwards velocity
    velocity.z *= -1;
    // set z location to fit within box
    location.z = boxSize - sphereR;
  } 
  
  // else if the location of the ball's back sticks out beyond the back of the box
  else if ((location.z - sphereR)< 0) {
    // change the direction of forwards/backwards velocity
    velocity.z *= -1;
    // set z location to fit within box
    location.z = sphereR;
  }

  pushMatrix();
  stroke(0);
  fill(175);
  
  // translate our drawing origin
  translate(location.x, location.y, location.z);
  
  // draw our ball there: a sphere of radius sphereR
  sphere(sphereR);
  popMatrix();
  
  // update our rotation angle, so every frame we get a slight rotation
  theta += 0.01;
}