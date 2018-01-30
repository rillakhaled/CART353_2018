class Walker {
  float x;
  float y;
  int sd;
  Random generator;


  Walker() {
    x = width/2;
    y = height/2;

    generator = new Random();
    // by default, mean is 0, and standard deviation is 1
    // I will set sd to 3 for bigger steps
    sd = 3;
  }

  void step() {

    // each step, we move in an xdir and a ydir
    // nextGaussian() returns a number between 0 and 1, we multiply this by our sd to get out xdir and ydir vals
    float xdir = (float)generator.nextGaussian() * sd;
    float ydir = (float)generator.nextGaussian() * sd;

    // add xdir and yrid to current location to give us our new position
    x += xdir;
    y += ydir;

    // ensure we don't go cruising off the screen: constrain x and y to screen locations
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }

  void display() {
    noStroke();
    fill(100);
    ellipse(x, y, 10, 10);
  }
}