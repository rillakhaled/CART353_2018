// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Confetti extends Particle {

  Confetti(PVector l) {
    super(l);
  }

  // Inherits update() from parent

  // we override Particle's display method
  void display() {
    rectMode(CENTER);
    noStroke();
    // randomly choose a soft color to display in
    int r = int(random(75, 255));
    int g = int(random(75, 255));
    int b = int(random(75, 255));
    color c = color(r, g, b);
    fill(c, lifespan);
    pushMatrix();
    translate(position.x, position.y);
    float theta = map(position.x, 0, width, 0, TWO_PI*2);
    rotate(theta);
    rect(0, 0, 12, 12);
    popMatrix();
  }
}