/* Rilla's solution to exercise 3.14 of Daniel Shiffman's Nature of Code

Exercise 3.14
Create an example that simulates a box sliding down the incline with friction. Note that 
the magnitude of the friction force is equal to the normal force. 

WARNING: I am unconvinced by my solution. */

float angle;
Mover m;

void setup() {
  size(600, 400); 

  angle = atan2(300.0, 600.0);
  m = new Mover(5, 600, 20);
}

void draw() {
  background(255);
  line(0, 350, 600, 50);

  // apply the downwards force: a gravity force, dependent on mass
  PVector gravity = new PVector(0, 3 * m.mass);
  m.applyForce(gravity);

  // work out the friction force - this involves the normal force
  PVector friction = m.velocity.get();

  // first get an appropriate direction i.e. opposite direction to m's velocity
  friction.mult(-1);
  friction.normalize();

  // now we need a magnitude, we have been told that this is equal to normal force
  // so let's solve for normal force

  // we have the formula Fn = Fg * cos(angle)
  float normalForceScalar = gravity.y * cos(angle);
  friction.mult(normalForceScalar);
  
  // apply the friction force
  m.applyForce(friction);
  
  // work out the normal force
  float nForceX = sin(angle)*-normalForceScalar;
  float nForceY = cos(angle)*-normalForceScalar;
  
  // apply the normal force
  PVector normalForce = new PVector(nForceX, nForceY);  
  m.applyForce(normalForce);

  m.update();
  m.angle = angle;
  m.display();
}