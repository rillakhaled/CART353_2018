// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  boolean fired; // a boolean flag so that we know whether to apply gravity + friction
  
  // Our Mover class has some additions: an angle, an angular velocity
  // and an angular acceleration 
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(1, 0);
    acceleration = new PVector(0, 0);
    fired = false;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    
    // update angular acceleration in accordance with a scaled version of acceleration.x
    aAcceleration = acceleration.x / 10.0;
    
    // update aVelocity and angle accordingly
    aVelocity += aAcceleration;
    angle += aVelocity;
    
    // resent our acceleration vector (note that we effectively reset aAcceleration 
    // each time we call update too
    acceleration.mult(0);
    
    // check we're not burrowing down below the screen - limit ypos to screen bottom
    float ypos = 300 - (mass * 25)/2;
    
    if(position.y > ypos) {
      position.y = ypos;
    }
  }

  void display() {
    noStroke();
    fill(0);
    rectMode(CENTER);
    
    // translate and rotate at the position of our Mover and with the angle of Mover
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    
    // draw our square box there
    rect(0, 0, mass*25, mass*25);
    popMatrix();
  }
}