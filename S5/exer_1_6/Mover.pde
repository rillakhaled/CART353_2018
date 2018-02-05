// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  PImage car;
  float xoff;
  float yoff;

  Mover() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 10;
    car = loadImage("car.png");
    xoff = 0.0;
    yoff = 1000;
  }

  void update() {
    setAcceleration();
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
  }

  // obatains a new value for acceleration based on perlin noise
  void setAcceleration() {

    // get a perlin noise val based on xoff for our horiz acceleration, scaled to [-0.05, 0.05]
    acceleration.x = map(noise(xoff), 0, 1, -0.05, 0.05);

    // get a perlin noise val based on yoff for our vert acceleration, scaled to [-0.05, 0.05]
    acceleration.y = map(noise(yoff), 0, 1, -0.05, 0.05);

    // update xoff and yoff
    xoff += 0.01;
    yoff += 0.01;
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    image(car, position.x, position.y);
  }

  // checkEdges() wraps position horizontally and vertically
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