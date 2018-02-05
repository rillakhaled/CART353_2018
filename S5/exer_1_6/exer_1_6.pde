/* Rilla's solution for exercise 1.6 in Daniel Shiffman's The Nature of Code 
and based on Mover code from example 1.8. Makes use of:

Car by H Alberto Gongora from the Noun Project.

Exercise 1.6
Referring back to the Introduction, implement acceleration according to Perlin noise. */

Mover mover;

void setup() {
  size(640,360);
  mover = new Mover(); 
}

void draw() {
  background(255);
  
  mover.update();
  mover.checkEdges();
  mover.display(); 
}  
  