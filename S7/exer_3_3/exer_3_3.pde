/* Rilla's solution for exercise 3.3 in Daniel Shiffman's The Nature of Code 
 
 Car by H Alberto Gongora from the Noun Project.
 
 Exercise 3.3
 Create a simulation of a vehicle that you can drive around the screen using the 
 arrow keys: left arrow accelerates the car to the left, right to the right. The 
 car should point in the direction in which it is currently moving. */


// Our mover (car)
Mover mover;

// A starting angle of zero
float theta = 0;

void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  background(255);

  // if we're pressing left
  if (keyPressed && keyCode == LEFT) {

    // decrease our angle, i.e. anticlockwise 
    // (clockwise movement would be represented by an increased angle)
    theta -= 0.05;

    // do cos and sin on our angle to get new x and y positions
    float x = cos(theta);
    float y = sin(theta);

    // turn x and y into an acceleration force
    PVector lforce = new PVector(x, y);
    mover.applyForce(lforce);
  }

  // if we're pressing right
  if (keyPressed && keyCode == RIGHT) {

    // increase our angle, i.e. clockwise
    theta += 0.05;

    // do cos and sin on our angle to get new x and y positions
    float x = cos(theta);
    float y = sin(theta);

    // turn x and y into an acceleration force
    PVector rforce = new PVector(x, y);
    mover.applyForce(rforce);
  }  

  mover.update();
  mover.checkEdges();
  mover.display();
}  