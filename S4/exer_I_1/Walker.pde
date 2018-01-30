class Walker {
  
  // x and y as floats
  float x;
  float y;

  Walker() {
    // initalise walker to start in centre of screen
    x = width/2;
    y = height/2;
  }

  void step() {
    
    
    // horiz. movement: walker should tend to the right
    int stepx = int(random(4))-1; 


    // stepx can be -1, 0, 1, or 2
    
    // if we get either 1 or 2, we set stepx to 1, i.e. x moves right by 1
    if (stepx > 1) {
      stepx = 1;
    }
    
    // if we get 0, stepx = 0, i.e. x stays put
    // if we get -1, stepx = -1, i.e. x moves left by 1

    x+= stepx;

    // vert. movement: walker should tend down
    int stepy = int(random(4))-1;

    // stepy can be -1, 0, 1, or 2
    
    // if we get either 1 or 2, we set stepy to 1, i.e. y moves down by 1
    if (stepy > 1) {
      stepy = 1;
    }
    
    // if we get 0, stepy = 0, i.e. y stays put
    // if we get -1, stepy = -1, i.e. y moves up by 1

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