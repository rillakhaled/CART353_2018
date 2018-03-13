// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  // PVectors for acceleration, velocity, and position, to make our trickle down effect possible
  PVector acceleration;
  PVector velocity;
  PVector position;

  float aVelocity = 0;
  float aAcceleration = 0;

  // max speed
  float topspeed;

  float asteroidLength = 20;
  float theta;

  Mover() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 7;
    theta = 0;
  }

  void update() {

    // add acceleration to velocity
    velocity.add(acceleration);

    // limit our velocity to top speed
    velocity.limit(topspeed);

    // update our car position
    position.add(velocity);


    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    fill(0);
    triangle(0, -asteroidLength/2, 0, asteroidLength/2, asteroidLength*1.5, 0);
    rect(-5, -asteroidLength/2+3, 5, 5);
    rect(-5, asteroidLength/2-8, 5, 5);
    popMatrix();
  }

  void specialdisplay() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    fill(0);
    triangle(0, -asteroidLength/2, 0, asteroidLength/2, asteroidLength*1.5, 0);
    fill(255, 0, 0);
    rect(-5, -asteroidLength/2+3, 5, 5);
    rect(-5, asteroidLength/2-8, 5, 5);
    popMatrix();
  }

  // checkEdges() wraps position horizontally
  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } else if (position.y < 0) {
      position.y = height;
    }
  }
}