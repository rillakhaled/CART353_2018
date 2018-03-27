/* Rilla's solution to exercise 4.14 in Daniel Shiffman's The Nature of Code,
based on Shiffman's code for example 4.9.

Exercise 4.14
Try blending with other modes, such as SUBTRACT, LIGHTEST, DARKEST, DIFFERENCE, 
EXCLUSION,or MULTIPLY. */

ParticleSystem ps;

PImage img;

void setup() {
  size(640, 360, P2D);

  // Create an alpha masked image to be applied as the particle's texture
  img = loadImage("texture.png");

  ps = new ParticleSystem(0, new PVector(width/2, 50));
}

void draw() {

  // Additive blending. Doesn't work on white, works best on dark colours.
  //blendMode(ADD);
  //background(255);

  // Subtractive blending. Doesn't work on black, works best on light colours
  //blendMode(SUBTRACT);
  //background(255);
  
  // Lightest mode blending. Turns our circles into confetti like squares - can't handle feathering?  
  blendMode(LIGHTEST);
  background(0);

  // Darkest mode blending. Like lightest, but in inverse - only visible on light colours.
  // blendMode(DARKEST);
  // background(255);

  // My renderer apparently can't handle this.
  // blendMode(DIFFERENCE);
  // background(255);
  
  // Exclusion mode blending. Related to lightest+darking, but with diminished facility for alpha?
  // blendMode(EXCLUSION);
  // background(255);
  
  // Multiplation mode blending. Similar to exclusion.
  // blendMode(MULTIPLY);
  // background(255);

  ps.run();
  for (int i = 0; i < 10; i++) {
    ps.addParticle();
  }
}