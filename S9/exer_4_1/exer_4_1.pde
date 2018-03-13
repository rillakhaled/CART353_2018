/* Rilla's solution to exercise 4.1 in Daniel Shiffman's The Nature of Code, 
based heavily on Shiffman's example 4.1 code.

Exercise 4.1
Rewrite the example so that the particle can respond to force vectors via an 
applyForce() function. */

Particle p;

void setup() {
  size(640,360);
  // initialise our new particle to start in the middle, top of our screen
  p = new Particle(new PVector(width/2,20));
  background(255);
  smooth();
}

void draw() {
  background(255);
  
  // run our particle
  p.run();
  
  // if that single particle is "dead"
  if (p.isDead()) {
  // re-initialise another particle to start in the middle, top of our screen
    p = new Particle(new PVector(width/2,20));
  }
}