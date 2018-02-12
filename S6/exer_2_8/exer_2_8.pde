/* Rilla's solution for exercise 2.8 in Daniel Shiffman's The Nature of Code 
 
 and based largely on Shiffman's code for example 2.7
 
 Exercise 2.8
 In the example above, we have a system (i.e. array) of Mover objects and one Attractor object. 
 Build an example that has systems of both movers and attractors. What if you make the attractors 
 invisible? Can you create a pattern/design from the trails of objects moving around attractors? 
 See the Metropop Denim project by Clayton Cubitt and Tom Carden for an example. */

// an array of Movers
Mover[] movers = new Mover[10];

// an array of Attractors
Attractor[] attractors = new Attractor[6];

void setup() {
  size(640, 360);

  // initialise our Movers array
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }

  // iniatialise our Attractors array - for each Attractor, establish a random mass and location
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