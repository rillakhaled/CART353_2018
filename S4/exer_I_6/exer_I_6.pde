/* Rilla's solution to exercise I.6 of Daniel Shiffman's Nature of Code

Exercise I.6
Use a custom probability distribution to vary the size of a step taken by the random walker. The step size 
can be determined by influencing the range of values picked. Can you map the probability exponentially—i.e. 
making the likelihood that a value is picked equal to the value squared? */

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