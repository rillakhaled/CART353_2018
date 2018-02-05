/* Rilla's solution to exercise 1.8 of Nature of Code.

Exercise 1.8
Try implementing the above example with a variable magnitude of acceleration, 
stronger when it is either closer or farther away. */


// A Mover object
Mover mover;

void setup() {
  size(640, 640);
  mover = new Mover(); 
}

void draw() {
  background(255);
  
  // Update the position
  mover.update();
  
  // Do edge constrain things
  mover.checkEdges();
  
  // Display the Mover
  mover.display(); 
}