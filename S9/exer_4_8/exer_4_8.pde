/* Rilla's solution for exercise 4.8 in Daniel Shiffman's The Nature of Code */

ParticleSystem ps;

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,50));
}

void draw() {
  background(255);
  // add a new particle each time we call draw as long as there are 
  // fewer than 200 particles in our ps
  
  // note that this will get filled with raindrops over time, since
  // they don't "die"
  if(ps.particles.size() < 200) {
    ps.addParticle();
  }
  ps.run();
}