// Seek
// Daniel Shiffman <http://www.shiffman.net>

// The "Vehicle" class

class Vehicle {
  
  // Vehicle now has a brain!
  Perceptron brain;
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

  Vehicle(int n, float x, float y) {
    brain = new Perceptron(n,0.001);
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    position = new PVector(x,y);
    r = 3.0;
    maxspeed = 4;
    maxforce = 0.1;
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
    
    position.x = constrain(position.x,0,width);
    position.y = constrain(position.y,0,height);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }
  
  // Here is where the brain processes everything
  void steer(ArrayList<PVector> targets, ArrayList<PVector> antitargets) {
    // Make an array of forces
    PVector[] forces = new PVector[targets.size()+antitargets.size()];
    
    // Steer towards all targets
    int count = 0;
    
    for (int i = 0; i < targets.size(); i++) {
      forces[count] = seek(targets.get(i), false);
      count++;
    }
    
    // Steer away from all targets
    for (int i = 0; i < antitargets.size(); i++) {
      forces[count] = seek(antitargets.get(i), true);
      count++;
    }
    
    // That array of forces is the input to the brain
    PVector result = brain.feedforward(forces);
    
    // Use the result to steer the vehicle
    applyForce(result);
    
    // Train the brain according to the error
    PVector error = PVector.sub(desired, position);
    brain.train(forces, error);
    
    /*PVector[] errors = new PVector[targets.size()];
    for(int i = 0; i < targets.size(); i++) {
      PVector errorwrtTarget = PVector.sub(targets.get(i), position);
      errors[i] = errorwrtTarget;
    }
    brain.train(forces, errors);*/
  }
  
  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target, boolean antitarget) {
    PVector desired = PVector.sub(target,position);  // A vector pointing from the position to the target
    
    if(antitarget) {
     desired = desired.mult(-2); 
    }
    
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    
    return steer;
  }
    
  void display() {
    
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    fill(175);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}