class Walker {
  float x;
  float y;

  Walker() {

    // Walker starts in the middle of the scren
    x = width/2;
    y = height/2;
  }

  void step() {

    float r = random(1);
    float stepx = 0.0;
    float stepy = 0.0;

    // 50% chance of moving in the direction of the mouse
    if (r < 0.5) {

      // work out pos of mouse in relation to x and y
      if (mouseX > x) {
        stepx = 1;
      } else {
        stepx = -1;
      }

      if (mouseY > y) {
        stepy = 1;
      } else {
        stepy = -1;
      }
    } else {
      stepx = random(-2, 2);
      stepy = random(-2, 2);
    }

    x+= stepx;
    y+= stepy;

    // ensure we don't go cruising off the screen: constrain x and y to screen locations
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }

  void display() {
    stroke(0);
    point(x, y);
  }
}