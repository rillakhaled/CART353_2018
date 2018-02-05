class Walker {

  // a PVector object to take care of location
  PVector location;

  float xoff;
  float yoff;


  Walker() {
    
    location = new PVector(width/2, height/2);
    
    xoff = 0;
    yoff = 10000;
  }

  void step() {
    int maxStepSize = 2;

    // map noise(xoff) from something between 0-1 to something in the range of [-maxStepSize, stepSize] 
    float xdir = map(noise(xoff), 0, 1, -maxStepSize, maxStepSize);

    // map noise(yoff) from something between 0-1 to something in the range of [-maxStepSize, stepSize] 
    float ydir = map(noise(yoff), 0, 1, -maxStepSize, maxStepSize);

    // update location.x and location.y
    location.x += xdir;
    location.y += ydir;

    // ensure we don't go cruising off the screen: constrain location.x and location.y to screen dimensions
    location.x = constrain(location.x, 0, width-1);
    location.y = constrain(location.y, 0, height-1);

    // update xoff and yoff
    xoff += 0.05;
    yoff += 0.05;
  }


  void display() {
    noStroke();
    fill(100);
    ellipse(location.x, location.y, 10, 10);
  }
}