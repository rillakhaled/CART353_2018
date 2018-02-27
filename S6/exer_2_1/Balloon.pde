class Balloon {

  PVector acceleration;
  PVector velocity;
  PVector position;
  PVector oldposition;
  PImage balloon;

  Balloon() {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    oldposition = new PVector(0,0);
    position = new PVector(width/2, height - 100);
    balloon = loadImage("balloon.png");
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  /* note that update() applies our accumulated acceleration
   and then it clears acceleration by multiplying by 0 */
  void update() {
    velocity.add(acceleration);
    oldposition.x = position.x;
    oldposition.y = position.y;
    position.add(velocity);
    acceleration.mult(0);
  }

  /* checkEdges ONLY does bounce stuff for walls, not for ceiling
   the forces take care of helium + ceiling bounce */
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