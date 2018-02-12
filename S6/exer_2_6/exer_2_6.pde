/* Rilla's solution for exercise 2.6 in Daniel Shiffman's The Nature of Code 
 
and based largely on Shiffman's code for example 2.5
 
Exercise 2.6
The formula for drag also included surface area. Can you create a simulation of 
boxes falling into water with a drag force dependent on the length of the side hitting the water? */


// Demonstration of multiple force acting on bodies (Mover class)
// Bodies experience gravity continuously
// Bodies experience fluid resistance when in "water"

// 9 moving bodies
Mover[] movers = new Mover[9];

// Liquid
Liquid liquid;

void setup() {
  size(640, 360);
  reset();
  // Create liquid object
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(255);

  // Draw water
  liquid.display();

  for (int i = 0; i < movers.length; i++) {

    // Is the Mover in the liquid?
    if (liquid.contains(movers[i])) {
      // Calculate drag force
      PVector dragForce = liquid.drag(movers[i]);
      // Apply drag force to Mover
      movers[i].applyForce(dragForce);
    }

    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    // Apply gravity
    movers[i].applyForce(gravity);

    // Update and display
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }

  fill(0);
  text("click mouse to reset", 10, 30);
}

void mousePressed() {
  reset();
}

// Restart all the Mover objects randomly
void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 3), 40+i*70, random(30));
  }
}