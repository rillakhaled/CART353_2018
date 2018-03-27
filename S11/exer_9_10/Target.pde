// Target is a subclass / child of Obstacle
// which has an overridden different "display" method
// and an overridden "contains" method
class Target extends Obstacle {

  PImage egg;
  float r;

  Target(float x, float y, float w_, float h_) {
    super(x, y, w_, h_);
    egg = loadImage("egg.png");
    r = 10;
  }

  void display() {
    fill(100);
    noStroke();
    ellipse(position.x, position.y, r*2, r*2);
  }

  // contains method assumes shape is a circle
  boolean contains(PVector spot) {

    float distance = dist(spot.x, spot.y, position.x, position.y);
    if (distance <= r) {
      return true;
    } else {
      return false;
    }
  }
}