/* Rilla's solution to exercise 1.8 of Nature of Code, extended for multiple Movers.

Exercise 1.8
Try implementing the above example with a variable magnitude of acceleration, 
stronger when it is either closer or farther away. */

Mover[] movers = new Mover[20];
 
void setup() {
  size(640,360);
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}
 
void draw() {
  background(255);
 
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}