class Head {

  // headImg1 and headImg2 are passed files
  PImage headImg1;
  PImage headImg2;

  // currentHead basically points at either headImg1 or headImg2
  // and I do any my calculations on currentHead
  PImage currentHead;

  float x;
  float y;
  float rot;

  // this boolean tracks which image we should currently be using
  // if true, we are using daniel.jpg
  boolean daniel;

  Head(String filename1, String filename2, float iX, float iY) {
    headImg1 = loadImage(filename1);
    headImg2 = loadImage(filename2);
    x = iX;
    y = iY;
    rot = 0.0;

    // in the constructor we set our daniel boolean to true
    // because we will begin by using the daniel image
    daniel = true;
    currentHead = headImg1;
  }

  void display() {
    translate(x, y);
    rotate(rot);
    imageMode(CENTER);
    image(currentHead, 0, 0);
  }

  void move() {

    // Adjust variables for animation
    x += 1.0;
    rot += 0.02;

    // if we've gone off the screen on the right
    if (x > width+currentHead.width) {

      // flip our daniel boolean
      daniel = !daniel;

      // if this now means the daniel boolean is true
      if (daniel) {
        // set currentHead to point at headImg1, which should be daniel.jpg
        currentHead = headImg1;
      } 
      // else this means that daniel boolean is false
      else {
        // have currentHead point at headImg2, i.e. catFace.jpg
        currentHead = headImg2;
      }

      // now move the x coord of currentHead to just off the left side of the screen
      x = -currentHead.width;
    }
  }
}