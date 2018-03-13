/* Rilla's solution to exercise 4.3 in Daniel Shiffman's The Nature of Code, 
based on Shiffman's example 4.3 code.

Exercise 4.3
Make the origin point move dynamically. Have the particles emit from the mouse 
location or use the concepts of velocity and acceleration to make the system 
move autonomously. */


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