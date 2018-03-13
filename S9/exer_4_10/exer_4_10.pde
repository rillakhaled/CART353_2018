/* Rilla's solution for exercise 4.10 in Daniel Shiffman's The Nature of Code,
based heavily on Shiffman's code for example 4.7.

Exercise 4.10
Create a particle system in which each particle responds to every other particle. 

I will implement this as a repel force. 

However, with small tweaks (i.e. changing the direction of the repel
force and turning off gravity force), we could turn this into an attract force. */

ParticleSystem ps;

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,50));
}

void draw() {
  background(255);
  ps.addParticle(new PVector(random(width),random(height)));
  
  // Apply gravity force to all Particles
  PVector gravity = new PVector(0,0.1);
  ps.applyForce(gravity);
  
  // Apply force from other particles
  ps.applyParticles();
  
  ps.run();
}