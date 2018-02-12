/* Rilla's solution for exercise 2.9 in Daniel Shiffman's The Nature of Code 
 
 and based largely on Shiffman's code for example 2.7
 
Exercise 2.9
It’s worth noting that gravitational attraction is a model we can follow to develop our 
own forces. This chapter isn’t suggesting that you should exclusively create sketches 
that use gravitational attraction. Rather, you should be thinking creatively about how 
to design your own rules to drive the behavior of objects. For example, what happens if 
you design a force that is weaker the closer it gets and stronger the farther it gets? Or 
what if you design your attractor to attract faraway objects, but repel close ones? */

Mover[] movers = new Mover[20];
Attractor[] attractors = new Attractor[6];

void setup() {
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor(random(30), random(width), random(height));
  }
}

void draw() {
  noStroke();
  fill(255, 5);
  rect(0, 0, width, height);

  // for every mover we have
  for (Mover m : movers) {

    // go through each attractor
    for (Attractor a : attractors) {

      // work out how much force that attractor has on that mover
      PVector f = a.attract(m);

      // apply that attractor's force on that mover, update its overall forces
      m.applyForce(f);
      a.display();
    }
    
    // now that we've accumulated the net force, call update and display on the mover
    m.update();
    m.display();
  }
}