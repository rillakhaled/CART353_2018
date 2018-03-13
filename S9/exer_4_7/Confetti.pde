// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Confetti extends Particle {

  // Variables to let us do angle rotations
  float theta = 0;
  float aVelocity = 0;

  Confetti(PVector l) {
    super(l);
  }

  // Override the update method
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    
    // update angular velocity in accordance with a scaled version of velocity.x
    // note we're not going to do anything with angular acceleration since plain
    // acceleration never changes
    float dir = 1;
    if(velocity.x != 0) {
      // the direction of our spin is related to direction of velocity
      
      // this calculation lets us extract velocity's "sign" (+ or -)
      dir = Math.abs(velocity.x)/velocity.x;
    }
    aVelocity += 0.0005 * dir;
    
    // update angle according to aVelocity
    theta += aVelocity;
    
    lifespan -= 2.0;
  }

  // Override the display method
  void display() {
    rectMode(CENTER);
    fill(127,lifespan);
    stroke(0,lifespan);
    strokeWeight(2);
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    rect(0,0,12,12);
    popMatrix();
  }
}