// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  // PVectors for acceleration, velocity, and position, to make our trickle down effect possible
  PVector acceleration;
  PVector velocity;
  PVector position;

  // max car speed
  float topspeed;

  // PImage to draw a car
  PImage car;

  Mover() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 10;
    car = loadImage("car.png");
  }

  void update() {
    // add acceleration to velocity
    velocity.add(acceleration);

    // limit our velocity to top speed
    velocity.limit(topspeed);

    // don't let it be a negative velocity (i.e. driving in reverse)
    if (velocity.x <= 0) {
      velocity.x = 0;
    }

    // update our car position
    position.add(velocity);
  }

  void accelerate(int i) {
    if (i == 0) {
      // set our acceleration to 0;
      acceleration = new PVector(0, 0);
    } else if (i == 1) {
      // set acceleration to a small positive amount
      acceleration = new PVector(0.1, 0);
    } else if (i == -1) {
      // set acceleration to a small negative amount
      acceleration = new PVector(-0.1, 0);
    }
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    image(car, position.x, position.y);
  }

  // checkEdges() wraps position horizontally
  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }
  }
}