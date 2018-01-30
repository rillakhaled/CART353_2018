/* Rilla's solution to exercise I.3 of Daniel Shiffman's Nature of Code

Exercise I.3
Create a random walker with dynamic probabilities. For example, can you give it a 
50% chance of moving in the direction of the mouse?*/

Walker w;

void setup() {
  size(640, 480);
  w = new Walker();
  background(255);
}

void draw() {
  
  w.step();
  w.display();
}