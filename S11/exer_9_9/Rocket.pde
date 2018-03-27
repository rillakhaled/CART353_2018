// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Rocket class -- this is just like our Boid / Particle class
// the only difference is that it has DNA & fitness

class Rocket {

  // All of our physics stuff
  PVector position;
  PVector velocity;
  PVector acceleration;

  float fuel = 500;

  // Size
  float r;

  // How close did it get to the target
  float recordDist;

  // Fitness and DNA
  float fitness;
  DNA dna;
  // To count which force we're on in the genes
  int geneCounter = 0;

  boolean hitObstacle = false;    // Am I stuck on an obstacle?
  boolean hitTarget = false;   // Did I reach the target
  int finishTime;              // What was my finish time?

  //constructor
  Rocket(PVector l, DNA dna_) {
    acceleration = new PVector();
    velocity = new PVector();
    position = l.get();
    r = 4;
    dna = dna_;
    finishTime = 0;          // We're going to count how long it takes to reach target
    recordDist = 10000;      // Some high number that will be beat instantly
  }

  // FITNESS FUNCTION 
  // distance = distance from target
  // finish = what order did i finish (first, second, etc. . .)
  // f(distance,finish) =   (1.0f / finish^1.5) * (1.0f / distance^6);
  // a lower finish is rewarded (exponentially) and/or shorter distance to target (exponetially)
  void fitness() {
    if (recordDist < 1) recordDist = 1;

    // Reward finishing faster and getting close
    fitness = (1/(finishTime*recordDist*2));

    // Make the function exponential
    fitness = pow(fitness, 4);

    if (hitObstacle) fitness *= 0.05; // lose 95% of fitness hitting an obstacle
    if (hitTarget) fitness *= 3; // three the fitness for finishing!
  }

  // Run in relation to all the obstacles
  // If I'm stuck, don't bother updating or checking for intersection
  // Likewise if I'm out of fuel, don't bother
  void run(ArrayList<Obstacle> os) {
    float fuelConsumed = 0;
    
    // save currentPos as we will use it later to determine power consumption
    PVector currentPos = this.position.get();
    
    // while we haven't hit an obstacle, our target, OR run out of fuel
    if (!hitObstacle && !hitTarget && fuel > 0) {
      
      // Pull out 5 forces from dna - one for each thruster - apply them all
      for (int i = 0; i < 5; i++) {
        applyForce(dna.genes[geneCounter+i]);
      }
      // move geneCountner along
      geneCounter = (geneCounter + 5) % dna.genes.length;
      
      // do an update after applying our 5 thrusters
      update();
      
      // If I hit an edge or an obstacle
      obstacles(os);
    }

    // work out how much we just moved
    PVector newCurrentPos = this.position.get();
    newCurrentPos.sub(currentPos);
    float distTravelled = newCurrentPos.mag();
    
    // subtract it from fuel we have available
    fuel -= distTravelled;

    // Draw me!
    if (!hitObstacle) {
      display();
    }
  }

  // Did I make it to the target?
  void checkTarget() {
    float d = dist(position.x, position.y, target.position.x, target.position.y);
    if (d < recordDist) recordDist = d;

    if (target.contains(position) && !hitTarget) {
      hitTarget = true;
    } else if (!hitTarget) {
      finishTime++;
    }
  }

  // Did I hit an obstacle?
  void obstacles(ArrayList<Obstacle> os) {
    for (Obstacle obs : os) {
      if (obs.contains(position)) {
        hitObstacle = true;
      }
    }
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }


  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    //background(255,0,0);
    float theta = velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);

    // Thrusters
    rectMode(CENTER);
    fill(0);
    rect(-r/2, r*2, r/2, r);
    rect(r/2, r*2, r/2, r);

    // Rocket body
    fill(175);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();

    popMatrix();
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  boolean stopped() {
    return hitObstacle;
  }
}