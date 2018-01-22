
// Rilla's homage to "A Trip to the Moon"
// that uses color detection to control where the moon is

import processing.video.*;

PImage moonFace;
PImage background;

Capture video;
float threshold;

void setup() {

  size(640, 480);
  moonFace = loadImage("moonFace.png");
  background = loadImage("backgroundOnly.png");

  threshold = 500.0;

  // note: Processing gets freaked out with non standard camera dimensions
  video = new Capture(this, width, height);
  video.start();
}

void captureEvent(Capture c) {
  video.read();
}

void draw() {

  // draw the background at opacity of 50 (remember it goes up to 255) 
  // so that the moon leaves a trail
  
  tint(255, 50); 
  
  image(video, 0, 0);
  image(background, 0, 0);


  float currentBest = 500.0;

  int currentBestX = 0;
  int currentBestY = 0;

  // we will control the moon position by moving an object of a certain color

  video.loadPixels();

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x + y*width;
      
      // color information for the video pixel were currently looking at
      color c1 = video.pixels[loc];

      float r1 = red(c1);
      float g1 = green(c1);
      float b1 = blue(c1);

      // this is the color we will look for
      color c2 = color(255, 0, 0);

      float r2 = red(c2);
      float g2 = green(c2);
      float b2 = blue(c2);

      // calculate how far away our current video pixel's color is from that color
      float diff = dist(r1, g1, b1, r2, g2, b2);


      if (diff < threshold && diff < currentBest) {
        // what we're looking at is our current best, so record its details
        currentBest = diff;
        currentBestX = x;
        currentBestY = y;
      }
    }
  }

  // we found a sufficiently matching object so draw the face there
  // note my threshold is 150 - which is generous
  if (currentBest < 150) {
    image(moonFace, currentBestX, currentBestY);
  }

  // otherwise, don't draw anything */
}