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
    topspeed = 7;
    car = loadImage("car.png");
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

    // use the shortcut "heading()" method to get a direction angle for velocity
    float angle = velocity.heading();

    pushMatrix();

    // translate to car drawing position and rotate by angle
    translate(position.x+car.width/2, position.y+car.height/2);
    rotate(angle);

    // draw our car there
    image(car, -car.width/2, -car.height/2);
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