/* Rilla's solution to exercise I.7 of Daniel Shiffman's Nature of Code

Exercise I.7
In the above random walker, the result of the noise function is mapped directly to the Walker’s location. 
Create a random walker where you instead map the result of the noise() function to a Walker’s step size. */

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