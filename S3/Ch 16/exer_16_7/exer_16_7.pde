// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Rilla's solution to exercise 16.7 for CART 353

import processing.video.*;

// Variable for capture device
Capture video;

// Previous Frame
PImage prevFrame;

// How different must a pixel be to be a "motion" pixel
float threshold = 50;

// Array to save Point object locations
Point[] points;

// the number of Points we have in our array in each iteration of draw()
int numPoints;

void setup() {
  size(320, 240);
  // Using the default capture device
  video = new Capture(this, width, height);
  video.start();
  // Create an empty image the same size as the video
  prevFrame = createImage(video.width, video.height, RGB);
}

// New frame available from camera
void captureEvent(Capture video) {
  // Save previous frame for motion detection!!
  prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
  prevFrame.updatePixels();
  video.read();
}

void draw() {
  background(0);

  // reset array of Points
  points = new Point[5000];
  numPoints = 0;

  // You don't need to display it to analyze it!
  image(video, 0, 0);

  video.loadPixels();
  prevFrame.loadPixels();

  // Begin loop to walk through every pixel
  // Start with a total of 0

  float totalMotion = 0;

  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      int loc = x + y * video.width;

      // Step 2, what is the current color
      color current = video.pixels[loc];

      // Step 3, what is the previous color
      color previous = prevFrame.pixels[loc];

      // Step 4, compare colors (previous vs. current)
      float r1 = red(current); 
      float g1 = green(current);
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous);
      float b2 = blue(previous);

      // Motion for an individual pixel is the difference between the previous color and current color.
      float diff = dist(r1, g1, b1, r2, g2, b2);

      // totalMotion is the sum of all color differences. 
      totalMotion += diff;

      // if the diff is over our threshold, we save the location details into our array
      // we can retrieve the x,y information later to help us determine a mean location of motion
      if (diff > threshold && numPoints < 4999) {
        points[numPoints] = new Point(x, y);
        numPoints++;
      }
    }
  }

  // find the mid point of all the saved Points
  float accumulatedXLoc = 0;
  float accumulatedYLoc = 0;

  for (int i = 0; i < numPoints; i++) {
    accumulatedXLoc += points[i].x;
    accumulatedYLoc += points[i].y;
  }

  // xLoc & yLoc will be our mean location of motion
  float xLoc = accumulatedXLoc/numPoints;
  float yLoc = accumulatedYLoc/numPoints;

  // averageMotion is total motion divided by the number of pixels analyzed.
  float avgMotion = totalMotion / video.pixels.length; 

  // Draw a circle at (xLoc, yLoc) with r determined by average motion
  noStroke();
  fill(0);
  float r = avgMotion * 2;
  ellipse(xLoc, yLoc, r, r);
}