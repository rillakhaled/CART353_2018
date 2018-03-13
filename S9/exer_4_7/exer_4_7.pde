/* Rilla's solution for exercise 4.7 in Daniel Shiffman's The Nature of Code 
and based heavily on Shiffman's code for example 4.5.

Exercise 4.7
Instead of using map() to calculate theta, how would you model angular velocity and acceleration? */

ParticleSystem ps;

void setup() {
  size(640,360);
  ps = new ParticleSystem(new PVector(width/2,50));
}

void draw() {
  background(255);
  ps.addParticle();
  ps.run();
}