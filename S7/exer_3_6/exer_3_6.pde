/* Rilla's solution for exercise 3.6 in Daniel Shiffman's The Nature of Code 
 
Exercise 3.6
Using the sine function, create a simulation of a weight (sometimes referred to 
as a “bob”) that hangs from a spring from the top of the window. Use the map() 
function to calculate the vertical location of the bob. Later in this chapter, 
we’ll see how to recreate this same simulation by modeling the forces of a spring 
according to Hooke’s law. */

void setup() {
  size(640,360);
}
 
void draw() {
  background(255);
 
 // set period to 120 frames i.e. go through a complete cycle every 120 frames
  float period = 120;
  
  // frameCount/period basically works out how far through each oscillation we are
  // multiplying this amount by TWO_PI gives us the angle to feed into cos
  // and the resultant y value gives us our oscillation "height"
  float y = cos(TWO_PI * frameCount / period);
  
  // cos will return something between [-1, 1]
  // map this to an amount in the range of [100, 250]
  y = map(y, -1, 1, 100, 250);
  
  stroke(0);
  fill(175);
  translate(width/2, 0);
  
  // draw a line and an ellipse reflecting this oscillation hight
  line(0, 0, 0, y);
  ellipse(0, y, 20, 20);
}