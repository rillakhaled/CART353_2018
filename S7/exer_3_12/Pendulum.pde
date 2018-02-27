// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Pendulum

class Pendulum {
  PVector position;    // position of pendulum ball
  PVector origin;      // position of arm origin
  float r;             // Length of arm
  float angle;         // Pendulum arm angle
  float aVelocity;     // Angle velocity
  float aAcceleration; // Angle acceleration
  float damping;       // Arbitary damping amount

  // Pendulum constructor takes r - arm length - as an argument
  Pendulum(float r_) {

    // initialise our variables - note that we will update origin in a separate method
    position = new PVector();
    r = r_;
    angle = PI/4;

    aVelocity = 0.0;
    aAcceleration = 0.0;
    damping = 0.995;   // Arbitrary damping
  }


  // each time we've updated the pendulum this one is attached to
  // we need up update this pendulum's point of origin
  // to be that pendulum's updated position
  void setOrigin(PVector o) {
    origin = o.get();
  }

  void go() {
    update();
    display();
  }

  // Function to update position
  void update() {
    float gravity = 0.4;                              // Arbitrary constant
    aAcceleration = (-1 * gravity / r) * sin(angle);  // Calculate acceleration (see: http://www.myphysicslab.com/pendulum1.html)
    aVelocity += aAcceleration;                 // Increment velocity
    aVelocity *= damping;                       // Arbitrary damping
    angle += aVelocity;                         // Increment angle
  }

  void display() {

    // polar to cartesian conversion
    position.set(r*sin(angle), r*cos(angle)); 

    // make the position relative to the pendulum's origin
    position.add(origin);                              

    // draw an arm
    stroke(0);
    strokeWeight(2);
    line(origin.x, origin.y, position.x, position.y);

    // draw a ball
    ellipseMode(CENTER);
    fill(0);
    ellipse(position.x, position.y, 30, 30);
  }
}