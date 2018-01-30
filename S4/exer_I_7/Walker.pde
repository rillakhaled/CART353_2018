class Walker {
  float x;
  float y;

  float xoff;
  float yoff;


  Walker() {
    x = width/2;
    y = height/2;

    xoff = 0;
    yoff = 10000;
  }

  void step() {
    int maxStepSize = 2;

    // map noise(xoff) from something between 0-1 to something in the range of [-maxStepSize, stepSize] 
    float xdir = map(noise(xoff), 0, 1, -maxStepSize, maxStepSize);

    // map noise(yoff) from something between 0-1 to something in the range of [-maxStepSize, stepSize] 
    float ydir = map(noise(yoff), 0, 1, -maxStepSize, maxStepSize);

    // update x and y
    x += xdir;
    y += ydir;

    // ensure we don't go cruising off the screen: constrain x and y to screen locations
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);

    // update xoff and yoff
    xoff += 0.05;
    yoff += 0.05;
  }


  void display() {
    noStroke();
    fill(100);
    ellipse(x, y, 10, 10);
  }
}