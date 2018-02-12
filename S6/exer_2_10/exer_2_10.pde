/* Rilla's solution for exercise 2.10 in Daniel Shiffman's The Nature of Code 
 
 and based largely on Shiffman's code for example 2.8
 
Exercise 2.10
Change the attraction force in Example 2.8 to a repulsion force. Can you create an example 
in which all of the Mover objects are attracted to the mouse, but repel each other? Think 
about how you need to balance the relative strength of the forces and how to most effectively 
use distance in your force calculations. */


Mover[] movers = new Mover[20];


void setup() {
  size(640,360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,2),random(width),random(height)); 
  }
}

void draw() {
  background(255);

  // for every mover i
  for (Mover i : movers) {
    
    // look at every other mover
    for (Mover j : movers) {
      if (i != j) {
        
        // work out the force the other mover is having on mover i
        PVector force = j.attract(i, -0.1);
        
        // apply that force to mover i
        i.applyForce(force);
      }
    }
    
    // next, work out the force the mouse exerts on mover i
    PVector mouse = new PVector(mouseX, mouseY);
    PVector mforce = i.attract(mouse, 5);
    
    // apply that force to mover i
    i.applyForce(mforce);
    
    // finally, update and display mover i
    i.update();
    i.display();
  }

}