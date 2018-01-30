/* Rilla's solution to exercise I.5 of Daniel Shiffman's Nature of Code

Exercise I.5
A Gaussian random walk is defined as one in which the step size (how far the object moves in a 
given direction) is generated with a normal distribution. Implement this variation of our random walk.*/

import java.util.*;

Walker w;

void setup() {
  size(640, 480);
  w = new Walker();
  background(255);
}

void draw() {
  
  // draw a rectangle over the whole screen with an alpha val of 3 to make the walker have a fading trail
  fill(255, 3);
  rect(0, 0, width, height);
  
  w.step();
  w.display();
}