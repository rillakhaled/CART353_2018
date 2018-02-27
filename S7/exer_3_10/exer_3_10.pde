/* Rilla's solution for exercise 3.10 in Daniel Shiffman's The Nature of Code 

Exercise 3.10
Encapsulate the above examples into a Wave class and create a sketch 
that displays two waves (with different amplitudes/periods) as in the 
screenshot below. Move beyond plain circles and lines and try visualizing 
the wave in a more creative way. */

// 2 wave objects
Wave w1;
Wave w2;

void setup() {
  size(640, 360);
  
  // initialise each object with different parameters (see Wave class)
  w1 = new Wave(100, 0.01, 0.2, 10, 100, 100);
  w2 = new Wave(25, 0.02, 0.5, 15, 250, 250);
}

void draw() {
  background(255);
  
  // let 'em do their oscillate thing
  w1.oscillate();
  w2.oscillate();
}