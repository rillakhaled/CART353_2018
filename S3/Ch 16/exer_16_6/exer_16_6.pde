// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-12: Simple background removal

// Click the mouse to memorize a current background image
import processing.video.*;

// Variable for capture device
Capture video;

// Saved background
PImage backgroundImage;

// moonLanding is the variable for the image I will "green screen" onto
// NB it is the same size as my video
// this will become useful later when I use it as a background for motion
// detected from my video stream
PImage moonLanding;


// How different must a pixel be to be a foreground pixel
// how do low values make the sketch act?
// how about high values?
float threshold = 100;

void setup() {
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();
  // Create an empty image the same size as the video
  backgroundImage = createImage(video.width, video.height, RGB);
  moonLanding = loadImage("moonLanding.jpg");
}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

void draw() {
  
  threshold = map(mouseX, 0, 640, 0, 200);
  
  // We are looking at the video's pixels, the memorized backgroundImage's pixels, the pixels of our "green screen" img, as well as accessing the display pixels. 
  
  loadPixels();
  moonLanding.loadPixels();
  video.loadPixels(); 
  backgroundImage.loadPixels();

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width; // Step 1, what is the 1D pixel location
      color fgColor = video.pixels[loc]; // Step 2, what is the foreground color

      // Step 3, what is the background color
      color bgColor = backgroundImage.pixels[loc];

      // Step 4, compare the foreground and background color
      float r1 = red(fgColor);
      float g1 = green(fgColor);
      float b1 = blue(fgColor);
      float r2 = red(bgColor);
      float g2 = green(bgColor);
      float b2 = blue(bgColor);
      float diff = dist(r1, g1, b1, r2, g2, b2);

      // Step 5, Is the foreground color different from the background color
      if (diff > threshold) {
        // If so, display the foreground color
        pixels[loc] = fgColor;
      } else {
        // If not, show the moon landing image
        pixels[loc] = moonLanding.pixels[loc];
      }
    }
  }
  updatePixels();
}

void mousePressed() {
  
  // Copying the current frame of video into the backgroundImage object
  // Note copy takes 9 arguments:
  
  // The source image
  // x, y, width, and height of region to be copied from the source
  // x, y, width, and height of copy destination
  backgroundImage.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
  backgroundImage.updatePixels();
}