import processing.video.*;

PImage selection;

Capture video;
float threshold;
int mouseDownX = 0;
int mouseDownY = 0;
int mouseUpX = 0;
int mouseUpY = 0;

color c2 = color(0, 0, 255);

void setup() {

  size(640, 480);
  video = new Capture(this, width, height);
  video.start();
}

void captureEvent(Capture c) {
  video.read();
  if (selection == null) {
    selection = new PImage(50, 50, RGB);
    selection.copy(video, 0, 0, 50, 50, 0, 0, 50, 50);
  }
  
}

void draw() {

  image(video, 0, 0);

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

      // c2 is the color we will look for, which we set in the mouseReleased method below
      float r2 = red(c2);
      float g2 = green(c2);
      float b2 = blue(c2);

      // calculate how far away our current video pixel's color is from that color
      float diff = dist(r1, g1, b1, r2, g2, b2);

      if (diff < currentBest) {
        // what we're looking at is our current best, so record its details
        currentBest = diff;
        currentBestX = x;
        currentBestY = y;
      }
    }
  }

  // we found a sufficiently matching object so draw the image selection
  // note my threshold is 10
  if (currentBest < 10 && selection !=null) {
    image(selection, currentBestX, currentBestY);
  }

  // otherwise, don't draw anything */
}

public void mousePressed() {
  mouseDownX = mouseX;
  mouseDownY = mouseY;
}

public void mouseReleased() {
  mouseUpX = mouseX;
  mouseUpY = mouseY;
  
  // if it looked like user did a mouseClicked type event
  if (abs(mouseUpX-mouseDownX) == 0 || abs(mouseUpY-mouseDownY) == 0) {
    // set the color
    c2 = video.pixels[mouseX + mouseY*width];
    println("setting color: " +red(c2)+" "+green(c2)+" "+blue(c2));
  } 
  // otherwise the user dragged out a new selection for us to use as the image
  else {
    // update the size of the selection image
    selection.resize(abs(mouseUpX-mouseDownX), abs(mouseUpY-mouseDownY));
    
    // now update selection's contents too
    if (mouseDownX < mouseUpX && mouseDownY < mouseUpY) { 
      selection.copy(video, mouseDownX, mouseDownY, abs(mouseUpX-mouseDownX), abs(mouseUpY-mouseDownY), 0, 0, abs(mouseUpX-mouseDownX), abs(mouseUpY-mouseDownY));
    } else {
      selection.copy(video, mouseUpX, mouseUpY, abs(mouseUpX-mouseDownX), abs(mouseUpY-mouseDownY), 0, 0, abs(mouseUpX-mouseDownX), abs(mouseUpY-mouseDownY));
    }
  }
}