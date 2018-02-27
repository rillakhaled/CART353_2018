/* Rilla's solution for exercise 3.5 in Daniel Shiffman's The Nature of Code 
 
 Exercise 3.5
 Simulate the spaceship in the game Asteroids. In case you aren’t familiar with Asteroids, 
 here is a brief description: A spaceship (represented as a triangle) floats in two 
 dimensional space. The left arrow key turns the spaceship counterclockwise, the right 
 arrow key, clockwise. The z key applies a “thrust” force in the direction the spaceship is 
 pointing. */

Mover mover;

// booleans to help keep track of what actions to put into effect
boolean left = false;
boolean right = false;
boolean thrust = false;

void setup() {
  size(640, 360);
  mover = new Mover();
}

void draw() {
  background(255);

  // if we're heading left, decrease angle
  if (left) {
    mover.theta -= 0.05;
  }


  // if we're heading right, increase angle
  if (right) {
    mover.theta += 0.05;
  } 

  // if thrust force is being applied
  if (thrust) {
    println("THRUST");
    // use cos and sin on mover.theta angle to derive y and x components
    float x = 2 * cos(mover.theta);
    float y = 2 * sin(mover.theta);

    // turn this into an acceleration vector and apply it to mover
    PVector force = new PVector(x, y);
    mover.applyForce(force);

    // call specialdisplay because thrust force in effect
    mover.display(1);
  } 

  // apply a friction force so that the thrust force wears off
  PVector friction = mover.velocity.get();
  friction.mult(-1);
  friction.mult(0.01);
  mover.applyForce(friction);

  // standard update things
  mover.update();
  mover.checkEdges();
  mover.display(0);
}  

void keyPressed() {
  println("keyPressed()");
  if (key == CODED && keyCode == LEFT) left = true;
  if (key == CODED && keyCode == RIGHT) right = true;
  if (key == 'Z' || key == 'z') thrust = true;
}


void keyReleased() {
  println("keyReleased() "+key);
  if (key == CODED && keyCode == LEFT) left = false;
  if (key == CODED && keyCode == RIGHT) right = false;
  if (key == 'Z' || key == 'z') thrust = false;
}