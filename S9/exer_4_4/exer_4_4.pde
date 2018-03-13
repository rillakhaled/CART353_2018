/* Rilla's solution for exercise 4.4 in Daniel Shiffman's The Nature of Code 
 
 Exercise 4.4
 Building off Chapter 3’s “Asteroids” example, use a particle system to emit particles 
 from the ship’s “thrusters” whenever a thrust force is applied. The particles’ initial 
 velocity should be related to the ship’s current direction. */

Mover mover;
int framecount;
ParticleSystem ps;

boolean left = false;
boolean right = false;
boolean thrust = false;

void setup() {
  size(640, 360);
  mover = new Mover();
  ps = new ParticleSystem(mover.position);
  framecount = 0;
}

void draw() {
  framecount++;
  background(255);


  if (left) {
    mover.theta -= 0.05;
  }
  if (right) {
    mover.theta += 0.05;
  } 
  if (thrust) {
    float x = 2 * cos(mover.theta);
    float y = 2 * sin(mover.theta);
    PVector force = new PVector(x, y);
    mover.applyForce(force);
    
    // so that the thrusters display red
    mover.specialdisplay();

    // here we run our particle system - we also add new particles
    // note that the origin point for our ps must be related to the ship's thruster location
    ps.setOrigin(mover.position);
    ps.setVelocity(mover.velocity);
    ps.addParticle();
  } 

  ps.run();

  PVector friction = mover.velocity.get();
  friction.mult(-1);
  friction.mult(0.01);
  mover.applyForce(friction);

  mover.update();
  mover.checkEdges();
  mover.display();
}  

void keyPressed() {
  println("keyPressed()");
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
  if (key == 'Z' || key == 'z') thrust = true;
}


void keyReleased() {
  println("keyReleased()");
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (key == 'Z' || key == 'z') thrust = false;
}