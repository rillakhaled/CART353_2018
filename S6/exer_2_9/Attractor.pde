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
    d = constrain(d, 5.0, 50.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)    
    
    // for modelling gravity, we divide by d^2
    // let's instead multiply by d i.e. the further away the bodies, the stronger the force
    // and let's scale the effect by an amount 
    float distanceMakesTheHeartGrowFond = (G * mass * m.mass) * (d * 0.0005);      // Calculate force magnitude
    // force.mult(distanceMakesTheHeartGrowFond);                                  // Get force vector --> magnitude * direction

    /*if(d < 20) {
      println("         CLOSE d: "+d+" distanceMakesTheHeartGrowFond "+distanceMakesTheHeartGrowFond);
    }
    else if(d > 30) {
      println("FAR d: "+d+" distanceMakesTheHeartGrowFond "+distanceMakesTheHeartGrowFond);
    }*/

    // this is a different force that repels things close by and attracts things far away
    // we've done a constrain, we know we're dealing with [5, 50]
    // for repelling, we need to get a direction opposite to our force's direction
    // i.e. involve negative numbers when closer to 5
    // positive numbers when closer to 50
    float repelOrAttract = map(d, 5, 50, -0.0005, 0.0005);
    float complicatedHeart = (G * mass * m.mass) * (d * repelOrAttract);
    
    if(d < 20) {
      println("         CLOSE d: "+d+" repelOrAttract: "+repelOrAttract+" complicatedHeart "+complicatedHeart);
    }
    else if(d > 30) {
      println("FAR d: "+d+" repelOrAttract: "+repelOrAttract+" complicatedHeart "+complicatedHeart);
    }
    
    force.mult(complicatedHeart);                                  // Get force vector --> magnitude * direction
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