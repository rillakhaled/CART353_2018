class Dart extends Particle {

  float pLen;

  Dart(PVector l) {
    super(l);
    pLen = 5;
  }

  // Inherits update() from parent
  
  // we override Particle's display method
  void display() {
    stroke(0, lifespan);
    strokeWeight(1);
    fill(255, lifespan);
    pushMatrix();

    translate(position.x, position.y);
    rotate(velocity.heading());

    // draw a dart-like thing
    triangle(0, -pLen, 0, pLen, pLen*3, 0);
    line(0, 0, pLen*3, 0);

    popMatrix();
  }
}