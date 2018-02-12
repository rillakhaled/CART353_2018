/* Rilla's solution for exercise 2.5 in Daniel Shiffman's The Nature of Code 
 
and almost entirely based on Shiffman's code for example 2.5
 
Take a look at our formula for drag again: drag force = coefficient * speed * speed. 
The faster an object moves, the greater the drag force against it. In fact, an object 
not moving in water experiences no drag at all. Expand the example to drop the balls 
from different heights. How does this affect the drag as they hit the water?*/


/* The faster an object moves, the greater the drag force against it. 
In fact, an object not moving in water experiences no drag at all.

The higher an object is dropped from, the more velocity it builds up. 
Thus, the higher an object is dropped from, the greater a drag
force it experiences. */

// Five moving bodies
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
    movers[i] = new Mover(random(0.5, 3), 40+i*70, random(height));
  }
}