/* Rilla's solution to exercise 1.2 in Daniel Shiffman's Nature of Code

Exercise 1.2
Take one of the walker examples from the introduction and convert it to use PVectors. */

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