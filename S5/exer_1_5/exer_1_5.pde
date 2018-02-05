/* Rilla's solution for exercise 1.5 in Daniel Shiffman's The Nature of Code 
and based on Mover code from example 1.8. Makes use of:

Car by H Alberto Gongora from the Noun Project.

Exercise 1.5
Create a simulation of a car (or runner) that accelerates when you press the up 
key and brakes when you press the down key. */

Mover mover;

void setup() {
  size(640,360);
  mover = new Mover(); 
}

void draw() {
  background(255);
  
  if(keyPressed && keyCode == UP) {
   mover.accelerate(1); 
  }
  
  else if(keyPressed && keyCode == DOWN) {
    mover.accelerate(-1);
  }
  
  else {
    mover.accelerate(0);
  }
  
  mover.update();
  mover.checkEdges();
  mover.display(); 
}  
  