/* Rilla's solution to exercise 3.16 of Daniel Shiffman's Nature of Code

Exercise 3.16
Create a system of multiple bobs and spring connections. How would you have a 
bob connected to a bob with no fixed anchor? */

// Note: I have no gravity in this simulation

Bob[] bobs;
Spring[] springs;

void setup() {
  size(640, 360);

  bobs = new Bob[3];
  springs = new Spring[3];

  bobs[0] = new Bob(width/2, 100);
  bobs[1] = new Bob(100, 200);
  bobs[2] = new Bob(width-100, 200);

  springs[0] = new Spring(bobs[0], bobs[1], 200);
  springs[1] = new Spring(bobs[1], bobs[2], 100);
  springs[2] = new Spring(bobs[2], bobs[0], 220);
}

void draw() {
  background(255); 

  // Calculate the force the spring has on both of the bobs it is conmected to
  for (Spring s : springs) {
    s.connections();
  }

  // update where all the bobs are after springs have done their thing
  for (Bob b : bobs) {
    // Update bob
    b.update();
    // if it's being dragged, show it
    b.drag(mouseX, mouseY);
  }

  // draw all the spring lines
  for (Spring s : springs) {
    s.displayLine();
  }

  // draw all the bobs
  for (Bob b : bobs) {
    b.display();
  }

  fill(0);
  text("click on bob to drag", 10, height-5);
}


// For mouse interaction with bob
void mousePressed() {
  for (Bob b : bobs) {
    b.clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (Bob b : bobs) {
    b.stopDragging();
  }
}