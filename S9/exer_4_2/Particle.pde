// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float aAcceleration;
  float lifespan;
  
  float pLen;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-1, 0));
    position = l.get();
    lifespan = 255.0;
    pLen = 10;
  }

  void run() {
    applyForce();
    update();
    display();
  }
  
  void applyForce() {
  // stuff goes here 
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(1);
    fill(255, lifespan);
    pushMatrix();
    // translate to pos x & y to make drawing easier
    translate(position.x, position.y);
    
    // rotate to velocity.heading angle
    rotate(velocity.heading());
    
    triangle(0, -pLen, 0, pLen, pLen*3, 0);
    line(0, 0, pLen*3, 0);

    popMatrix();
    
  }

  // Is the particle still "alive" based on lifespan
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}