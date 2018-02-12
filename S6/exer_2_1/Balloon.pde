class Balloon {

  PVector acceleration;
  PVector velocity;
  PVector position;
  PImage balloon;

  Balloon() {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    position = new PVector(width/2, height - 100);
    balloon = loadImage("balloon.png");
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void checkEdges() {

    if (position.x + balloon.width > width) {
      position.x = width - balloon.width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
    }
  }
  
  void display() {
    background(255);
    image(balloon, position.x, position.y);
  }
}