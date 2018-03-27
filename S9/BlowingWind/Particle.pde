// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  float mass = 1;

  Particle(PVector l) {
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    position = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);   
    acceleration.add(f);
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    float angle = velocity.heading();
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    
    stroke(100, lifespan);
    strokeWeight(1);
    
    line(0, 0, 7, 0);
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}