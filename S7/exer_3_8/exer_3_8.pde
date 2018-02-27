/* Rilla's solution for exercise 3.8 in Daniel Shiffman's The Nature of Code 

Exercise 3.8
Incorporate angular acceleration into the Oscillator object. */

// An array of oscillators
Oscillator[] oscillators;

float angle;

void setup() {
  size(600, 300);
  angle = 0.0;
  oscillators = new Oscillator[50];

  // go through our array initialising each oscillator
  for (int i = 0; i < oscillators.length; i++) {

    // give each oscillator a starting angle 
    oscillators[i] = new Oscillator(new PVector(0, angle));

    // every oscillator moves at the same velocity - all get the same PVector v for velocity
    PVector v = new PVector(0.1, 0.1);
    oscillators[i].velocity = v;

    // increase our angle so the next oscillator we make is initialised to an angle 
    // slightly different from this one
    angle += 0.5;
  }
}

void draw() {

  background(255);
  noStroke();

  // draw an insect body
  rect(150, 142, 300, 10, 5);

  // an insect head
  ellipse(145, 145, 15, 15);

  // eyes
  fill(100);
  ellipse(141, 145, 2, 2);
  ellipse(147, 145, 2, 2);

  // a mouth
  stroke(100);
  line(141, 148, 146, 148);
  
  // make a new acceleration force based on where the mouse is
  // i.e. the mouse controls the direction of the legs
  float accelX = map(mouseX, 0, width, -0.5, 0.5);
  PVector accelForce = new PVector(0, accelX);

  // for each oscillator
  for (int i = 0; i < oscillators.length; i++) {
    pushMatrix();
    // set a new drawing point based on which "leg" we're drawing
    translate(150 + i*6, 150);

    // update oscillation + angle settings, using our new accelForce vector
    oscillators[i].oscillate(accelForce);

    // display
    oscillators[i].display();
    popMatrix();
  }
}