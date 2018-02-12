// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A class for a draggable attractive body in our world

class Attractor {
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  PVector position;   // position
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector dragOffset;  // holds the offset for when object is clicked on

  Attractor(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    G = 1;
  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(position, m.position);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d, 5.0, 25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);      // Calculate gravitional force magnitude
    force.mult(strength);                                  // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);
    noStroke();
    fill(255, 0, 0, 200);
    ellipse(position.x, position.y, mass*2, mass*2);
  }
}