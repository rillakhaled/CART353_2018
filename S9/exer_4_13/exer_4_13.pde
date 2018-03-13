/* Rilla's solution to exercise 4.13 in Daniel Shiffman's The Nature of Code,
based on Shiffman's code for example 4.9.

Exercise 4.13
Use tint() in combination with additive blending to create a rainbow effect. */

ParticleSystem ps;

PImage img;

void setup() {
  size(640, 360, P2D);

  // Create an alpha masked image to be applied as the particle's texture
  img = loadImage("texture.png");

  ps = new ParticleSystem(0, new PVector(width/2, 50));
}

void draw() {

  // Additive blending!
  blendMode(ADD);

  background(0);

  ps.run();
  for (int i = 0; i < 10; i++) {
    ps.addParticle();
  }
}