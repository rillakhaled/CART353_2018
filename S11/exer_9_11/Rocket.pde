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

  float maxforce;
  float maxspeed;

  // A FlowField object (which will house DNA)
  FlowField flow;

  ArrayList<PVector> points;
  int strokeCol = 255;

  PImage img;

  float fuel = 1500;

  // Size
  float r;

  // How close did it get to the target
  float recordDist;

  // Fitness and DNA
  float fitness;

  boolean hitObstacle = false;    // Am I stuck on an obstacle?
  boolean hitTarget = false;   // Did I reach the target
  int finishTime;              // What was my finish time?

  //constructor
  Rocket(PVector l, DNA d, int totalRockets, float ms, float mf, PImage image) {
    acceleration = new PVector();
    velocity = new PVector();
    position = l.get();

    maxforce = mf;
    maxspeed = ms;

    r = 4;
    finishTime = 0;          // We're going to count how long it takes to reach target
    recordDist = 10000;      // Some high number that will be beat instantly

    img = image;

    points = new ArrayList<PVector>();

    flow = new FlowField(20, d);
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
    flow.update();
    float fuelConsumed = 0;
    PVector currentPos = this.position.get();
    if (!hitObstacle && !hitTarget && fuel > 0) {

      PVector desired = flow.lookup(position);
      desired.mult(maxspeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);

      update();
      // If I hit an edge or an obstacle
      obstacles(os);
    }

    PVector newCurrentPos = this.position.get();

    newCurrentPos.sub(currentPos);
    float distTravelled = newCurrentPos.mag();
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
    points.add(position.get());
    acceleration.mult(0);
  }

  void display() {
    if (!hitTarget) {
      float theta = velocity.heading2D() + PI/2;
      fill(200, 100);
      pushMatrix();
      translate(position.x, position.y);
      rotate(theta);
      float alphaVal = map(fuel, 0, 500, 0, 255);
      tint(255, alphaVal);
      image(img, 0, 0);
      popMatrix();
    } else {
      strokeCol -= 2;
      strokeCol = constrain(strokeCol, 0, 255);
      stroke(strokeCol);
      strokeWeight(3);

      for (int i = 1; i < points.size(); i++) {
        line(points.get(i-1).x, points.get(i-1).y, points.get(i).x, points.get(i).y);
      }
    }
  }

  float getFitness() {
    return fitness;
  }

  boolean stopped() {
    return hitObstacle;
  }
}