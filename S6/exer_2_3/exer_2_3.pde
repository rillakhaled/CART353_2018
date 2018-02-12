// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

//Mover[] movers = new Mover[20];
Mover[] movers = new Mover[10];

Mover m;
int frame;

void setup() {
  size(640, 360);

  // make 10 movers
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 4), 2*16, 0);
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {

    // position.x will give us the centre point for a mover
    // work out the distance between the left wall and the mover's left side
    float ldist = movers[i].position.x - movers[i].mWidth/2;

    // if it is sufficiently close
    if (ldist <= 70) {

      // make sure it's not negative
      ldist = constrain(ldist, 0, 70);

      // map between ldist [0, 70] to a variable sized force [1, 0.2]
      float lForce = map(ldist, 0, 70, 1, 0.2);

      // make this into a force
      PVector l_edgeForce = new PVector(lForce, 0);

      // apply it
      movers[i].applyForce(l_edgeForce);
    }


    // position.x will give us the centre point for a mover
    // work out the distance between the right wall and the mover's right side
    float rdist = width - (movers[i].position.x + movers[i].mWidth/2);

    // if it is sufficiently close
    if (rdist <= 70) {

      // make sure it's not negative
      rdist = constrain(rdist, 0, 70);

      // map from rdist [0, 70] to a variable sized force [1, 0.2]
      float rForce = map(rdist, 0, 70, 1, 0.2);

      // make this into a force --> note the minus sign applied to rforce
      PVector r_edgeForce = new PVector(-rForce, 0);

      // apply it
      movers[i].applyForce(r_edgeForce);
    }

    // apply gravity force too
    PVector gravity = new PVector(0, 0.1);
    movers[i].applyForce(gravity);

    // now that all forces are applied, call update, display, and checkEdges
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}