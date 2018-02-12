// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float mWidth;
  float mHeight;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mWidth = m*16;
    mHeight = m*16;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(0, 127);
    ellipse(position.x, position.y, mWidth, mHeight);
  }

  void checkEdges() {
    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    }
  }
}