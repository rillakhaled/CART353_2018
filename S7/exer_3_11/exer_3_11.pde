/* Rilla's solution for exercise 3.11 in Daniel Shiffman's The Nature of Code 

Exercise 3.11
More complex waves can be produced by the values of multiple waves together. 
Create a sketch that implements this, as in the screenshot below. */


// My solution averages together the heights of 2 different waves

// starting angle vals for each wave
float startAngle1 = 0;
float startAngle2 = 0.5;

// separate angular velocities
float angle1Vel = 0.1;
float angle2Vel = 0.05;

void setup() {
  size(640,360);
}

void draw() {
  background(255);

// update starting angles
  startAngle1 += 0.015;
  startAngle2 += 0.02;
  
  // initialise angles based on starting angles
  float angle1 = startAngle1;
  float angle2 = startAngle2;

  // draw ellipses to cover our whole screen spaced 2 pixels apart
 for (int x = 0; x <= width; x += 2) {
   
   // y1 is a sin wave of angle 1
    float y1 = map(sin(angle1), -1, 1, 0, height);
    
    // y2 is a cos wave of angle 2
    float y2 = map(cos(angle2), -1, 1, 50, height-50);
    
    // y is an average of y1 and y2
    float y = (y1+y2)/2;
    
    // draw an ellipse at (x, y)
    noStroke();
    fill(0,50);
    ellipse(x,y, 20, 20);
    
    // update angle1 and angle2 according to their separate velocities
    angle1 += angle1Vel;
    angle2 += angle2Vel;
  } 

}