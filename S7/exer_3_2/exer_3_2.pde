/* Rilla's solution for exercise 3.2 in Daniel Shiffman's The Nature of Code 

Exercise 3.2
Step 1: Create a simulation where objects are shot out of a cannon. Each object 
should experience a sudden force when shot (just once) as well as gravity (always present).

Step 2: Add rotation to the object to model its spin as it is shot from the cannon. 
How realistic can you make it look? */

// The Cannon image is by Hea Poh Lin, MY for War and Weapons (Glyph) Collection
// from the Noun Project


Mover m;
PVector groundFriction;
PImage cannon;

void setup() {
  size(800, 300);
  cannon = loadImage("cannon.png");
  image(cannon, 20, 180);
}

void draw() {
  background(255);
  image(cannon, 20, 180);
  
  // If there is a mover object and it has been fired
  if(m!= null && m.fired) {
    
    // Apply gravity as a force to it
    PVector gravity = new PVector(0, 0.1*m.mass);
    m.applyForce(gravity);

    // Apply some friction too - such that the rotation slows down 
    float c = 0.07;
    PVector friction = m.velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    m.applyForce(friction);
    
    m.update();
    m.display();
  }
}

void mousePressed() {
  // Make a new mover object representing the cannon when the mouse is pressed
  m = new Mover(1, 140, 205);
  
  // Apply a one time cannon force to it
  PVector cannon = new PVector(8.0, -4.0);
  m.applyForce(cannon);
  
  // Set its fired flag to be true
  m.fired = true;
  
}