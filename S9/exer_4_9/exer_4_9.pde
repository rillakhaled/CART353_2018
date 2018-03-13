/* Rilla's solution for exercise 4.9 in Daniel Shiffman's The Nature of Code,
based heavily on Shiffman's code for example 4.7.

Exercise 4.9
Expand the above example to include many repellers (using an array or ArrayList). */

ParticleSystem ps;
ArrayList<Repeller> repellers;

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,50));
  repellers = new ArrayList<Repeller>();
  
  for(int i = 0; i < 4; i++) {
    Repeller r = new Repeller(random(width), random(height));
    repellers.add(r);
  }
}

void draw() {
  background(255);
  ps.addParticle();
  
  // Apply gravity force to all Particles
  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
  
  // for each repeller
  for(Repeller r : repellers) {
    // work out the repeller's force on that particle system
    ps.applyRepeller(r);
    r.display();
  }
  
  // now call run on the particle system
  ps.run();
}