/* Rilla's solution to exercise 3.12 of Daniel Shiffman's Nature of Code
 heavily based on code by Shiffman from example 3.10.
 
 Exercise 3.12
 String together a series of pendulums so that the endpoint of one is the origin 
 point of another. Note that doing this may produce intriguing results but will 
 be wildly inaccurate physically. */

// Create 3 pendulum objects
Pendulum p;
Pendulum p2;
Pendulum p3;

void setup() {

  size(640, 360);

  // Make a new Pendulum with an armlength of 100
  p = new Pendulum(100);

  // its origin point is the middle top of the screen
  p.setOrigin(new PVector(width/2, 0));

  // a second pendulum
  p2 = new Pendulum(150);

  // "connected" to the first
  p2.setOrigin(p.position.get());

  // a third pendulum
  p3 = new Pendulum(50);

  // connected to the second
  p3.setOrigin(p2.position.get());
}

void draw() {
  background(255);

  // update + display p
  p.go();

  // set p2's origin to be p's (recently acquired) position
  p2.setOrigin(p.position.get());

  // update + display p2
  p2.go();

  // set p3's origin to be p2's (recently acquired) position
  p3.setOrigin(p2.position.get());

  // update + display p3
  p3.go();
}