/* Rilla's solution for exercise 2.4 in Daniel Shiffman's The Nature of Code 
 
 and based on Shiffman's code for example 2.4
 
 Exercise 2.4
 Create pockets of friction in a Processing sketch so that objects only experience 
 friction when crossing over those pockets. What if you vary the strength (friction 
 coefficient) of each area? What if you make some pockets feature the opposite of 
 friction—i.e., when you enter a given pocket you actually speed up instead of slowing down?*/

Mover[] movers = new Mover[5];

void setup() {
  size(800, 200);

  // Set the seed parameter to a constant to return the 
  // same pseudo-random numbers each time the software is run.
  randomSeed(1);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 4), random(width), 0);
  }
  stroke(0);
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {

    // a wind force
    PVector wind = new PVector(0.01, 0);

    // a gravity force, dependent on mass
    PVector gravity = new PVector(0, 0.1*movers[i].mass);


    // note: our friction is kind of weird, in that it applies whenever we are in an appropriate x zone

    // sandpaper : coarse grain!
    float c = 0.05;
    PVector sandpaper1 = movers[i].velocity.get();
    sandpaper1.mult(-1);
    sandpaper1.normalize();
    sandpaper1.mult(c);

    // sandpaper : fine grain!
    c = 0.03;
    PVector sandpaper2 = movers[i].velocity.get();
    sandpaper2.mult(-1);
    sandpaper2.normalize();
    sandpaper2.mult(c);

    // antifriction ! ice, perhaps?
    c = 0.05;
    PVector antifriction = movers[i].velocity.get();
    // this is antifriction - so our direction is the same as velocity
    antifriction.mult(1); 
    antifriction.normalize();
    antifriction.mult(c);


    // check if movers[i] is in the zone of sandpaper 1: 100-250 //  && movers[i].position.y >= 170 && movers[i].position.y <= 200
    if (movers[i].position.x >= 100 && movers[i].position.x <= 250) {
      movers[i].applyForce(sandpaper1);
    } 

    // check if movers[i] is in the zone of sandpaper 2: 350-450 //  && movers[i].position.y >= 170 && movers[i].position.y <= 200
    if (movers[i].position.x >= 350 && movers[i].position.x <= 450) {
      movers[i].applyForce(sandpaper2);
    } 

    // check if movers[i] is in the zone of antifriction: 500-600 //  && movers[i].position.y >= 170 && movers[i].position.y <= 200
    else if (movers[i].position.x >= 500 && movers[i].position.x <= 600) {
      movers[i].applyForce(antifriction);
    }

    // apply wind and gravity
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }


  noStroke();

  textSize(16);
  text("sandpaper1", 120, 20); 

  // draw sandpaper1: 100 - 250
  rect(100, 0, 150, 200);

  textSize(16);
  text("sandpaper2", 355, 20); 

  // draw sandpaper2: 350 - 450
  rect(350, 0, 100, 200);

  textSize(16);
  text("antifriction", 505, 20); 

  // draw antifriction: 500 - 600
  rect(500, 0, 100, 200);
}