/* Rilla's solution to exercise I.1 of Daniel Shiffman's Nature of Code

Exercise I.1
Create a random walker that has a tendency to move down and to the right. 
(We’ll see the solution to this in the next section.) */

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