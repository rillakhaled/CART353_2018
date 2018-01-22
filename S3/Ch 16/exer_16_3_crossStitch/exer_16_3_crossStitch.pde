// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Rilla's response to exercise 16.3 for CART 353

import processing.video.*;

// Global variables: x and y as where we are currently drawing from
float x;
float y;

// crossSize as thesize of our cross stitches
float crossSize;

// Variable to hold onto Capture object
Capture video;

void setup() {
  size(320, 240);
  background(255);

  // start drawing from (0, 0)
  x = 0;
  y = 0;

  // set our crosses to 10 pixels in width and height
  crossSize = 10;

  strokeCap(ROUND);

  // Start the capture process
  video = new Capture(this, width, height);
  video.start();
}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

void draw() {

  video.loadPixels();


  // Find the midpoint of each line
  int midx = int((x + crossSize/2));
  int midy = int((y + crossSize/2));

  midx = constrain(midx, 0, width-1);
  midy = constrain(midy, 0, height-1);
  
  color c = 100;
  stroke(c);

  line(x, y, x+crossSize, y+crossSize);
  line(x, y+crossSize, x+crossSize, y);

  x += crossSize;

  // if we've hit the end of one row
  if (x >= width) {

    // as long as we haven't hit the bottom of the screen yet
    if (y < height) {

      // move us vertically down one cross stitch space, and reset our horiz position to the start of that "row"
      y += crossSize;
      x = 0;
      
    } else {
      // we have hit the bottom right corner, so let's reposition x and y to (0, 0) and restart drawing from top left corner
      y = 0;
      x = 0;
    }
  }
}