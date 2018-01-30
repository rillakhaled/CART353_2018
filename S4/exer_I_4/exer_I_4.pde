/* Rilla's solution to exercise I.4 of Daniel Shiffman's Nature of Code

Exercise I.4
Consider a simulation of paint splatter drawn as a collection of colored dots. 
Most of the paint clusters around a central location, but some dots do splatter 
out towards the edges. Can you use a normal distribution of random numbers to 
generate the locations of the dots? Can you also use a normal distribution of 
random numbers to generate a color palette? */

import java.util.*; 

Splatter s; // our splatter object
int counter; // counter lets us have a splatter refresh rate

void setup() {
  size(480, 480);
  s = new Splatter();
  counter = 0;
}

void draw() {
  counter++;
  
  // every 50 frames, get splatter to re-splatter on the canvas
  if(counter % 50 == 0) {
    background(255);
    s.activate();
  }
}