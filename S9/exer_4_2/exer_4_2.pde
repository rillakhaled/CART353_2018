/* Rilla's solution to exercise 4.2 in Daniel Shiffman's The Nature of Code, 
based heavily on Shiffman's example 4.1 code.

Exercise 4.2
Add angular velocity (rotation) to the particle. Create your own non-circle particle design. */


Particle p;

void setup() {
  size(640,360);
  p = new Particle(new PVector(width/2,20));
  background(178, 227, 244);
  smooth();
}

void draw() {
  background(178, 227, 244);
  
  p.run();
  if (p.isDead()) {
    p = new Particle(new PVector(width/2,20));
  }
}