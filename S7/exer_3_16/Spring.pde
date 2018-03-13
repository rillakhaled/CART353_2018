// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Oscillation

// Class to describe an anchor point that can connect to "Bob" objects via a spring
// Thank you: http://www.myphysicslab.com/spring2d.html


class Spring { 

  // what is this spring connected to? both ends are bobs
  Bob b1;  
  Bob b2;

  // rest length and spring constant
  float len;
  float k = 0.2;


  // constructor that takes 2 bobs and a length
  Spring(Bob b_1, Bob b_2, int l) {
    b1 = b_1;
    b2 = b_2;
    len = l;
  } 

  // connections method establishes spring's force on both bobs it is connected to
  void connections() {
    connect(b1, b2);
    connect(b2, b1);
  }

  // Calculate spring force
  void connect(Bob b1, Bob b2) {
    
    // Vector pointing from anchor to bob position
    PVector force = PVector.sub(b1.position, b2.position);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = d - len;

    // Calculate force according to Hooke's Law
    // F = - k * stretch
    force.normalize();
    force.mult(-1 * k * stretch);
    b1.applyForce(force);
  }

  void display() { 
    stroke(0);
    fill(175);
    strokeWeight(2);
    rectMode(CENTER);
    rect(b1.position.x, b1.position.y, 10, 10);
  }

  void displayLine() {
    strokeWeight(2);
    stroke(0);
    line(b1.position.x, b1.position.y, b2.position.x, b2.position.y);
  }
}