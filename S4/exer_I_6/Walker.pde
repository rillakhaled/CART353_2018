class Walker {
  float x;
  float y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void step() {
    int multiplier = 3;

    // determine our stepsize for stepx and stepy via 2 calls to montecarlo()

    // for stepx
    float stepsize = montecarlo() * multiplier;
    float stepx = random(-stepsize, stepsize);

    // for stepy, reusing stepsize variable (we don't need it above anymore)
    stepsize = montecarlo() * multiplier;
    float stepy = random(-stepsize, stepsize);

    x += stepx;
    y += stepy;

    // ensure we don't go cruising off the screen: constrain x and y to screen locations
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }

  float montecarlo() {

    // keep running this loop until we are able to return something for r1
    while (true) {

      // pick a random value: r1
      float r1 = random(1);

      // pick a "qualifying" random value, i.e. one that determines whether our first value will qualify: r2
      float r2 = random(1);

      // if our second value is less than our first value squared, accept our first value
      if (r2 < (r1*r1)) {
        return r1;
      }
    }
  }

  void display() {
    noStroke();
    fill(100);
    ellipse(x, y, 10, 10);
  }
}