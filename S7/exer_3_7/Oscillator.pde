class Oscillator {

  // our 3 vectors: one for angle, one for angular velocity, another for amplitude
  PVector angle;
  PVector velocity;
  PVector amplitude;

  Oscillator(PVector theAngle) {
    angle = theAngle;
    
    // amplitude impacts on how long the legs look and how they seem to rotate
    amplitude = new PVector(10, 5);
  }

  // add angular velocity to our angle vector to give us a new position
  void oscillate() {
    angle.add(velocity);
  }

  void display() {

    // determine x and y based on polar-cartesian coordinates math
    float x = cos(angle.x) * amplitude.x;
    float y = sin(angle.y) * amplitude.y;

    // draw a line for a leg
    pushMatrix();
    stroke(100);
    fill(175);
    line(0, 0, x, y);
    popMatrix();
  }
}