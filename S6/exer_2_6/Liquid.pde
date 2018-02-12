// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Liquid class 
class Liquid {


  // Liquid is a rectangle
  float x, y, w, h;
  // Coefficient of drag
  float c;

  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }

  // Is the Mover in the Liquid?
  boolean contains(Mover m) {
    PVector l = m.position;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }

  // Calculate drag force
  PVector drag(Mover m) {
    
    // simplified drag magnitude is coefficient * speed * speed
    // more accurate drag magnitude includes area too: coefficient * speed * speed * area
    // we will model area based on box length, which is m.mass * 16
    // then scale it by 0.1 as otherwise drag force is hilariously too strong
    
    float area = m.mass * 16 * 0.1;
    
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed * area;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);

    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }

  void display() {
    noStroke();
    fill(50);
    rect(x, y, w, h);
  }
}