// Rilla's response to exercise 16.1 of Learning Processing for CART 353

import processing.video.*;

// declare a new Capture object
Capture video;

void setup() {
  size(320, 240);
  video = new Capture(this, 320, 240); 
  video.start();
}


// when the video becomes available, start reading frames
void captureEvent(Capture video) {
  video.read();
}

void draw() {

  // load up video's pixels
  video.loadPixels();

  // pick a random pixel location on the screen
  float x = random(width);
  float y = random(height);

  // get the color at that location from video's pixel array
  color c = video.pixels[(int)x + (int)y*width];


  // draw an ellipse there of that color
  fill(c);
  noStroke();
  ellipse(x, y, 20, 20);
}