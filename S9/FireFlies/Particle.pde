

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  float mass = 1; // Let's do something better here!

  // Uses fire fly image by Jim Sullivan from the Noun Project
  PImage firefly;


  Particle(PVector l, PImage ff) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-3, 3), random(-3, 3));
    position = l.get();
    lifespan = random(200, 400); 
    firefly = ff;
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
    pushMatrix();
    translate(position.x, position.y);
    rotate(velocity.heading());
    imageMode(CENTER);
    image(firefly, 0, 0);
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