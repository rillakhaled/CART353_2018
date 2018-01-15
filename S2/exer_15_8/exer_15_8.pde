// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-9: Adjusting image brightness based on pixel location (Flashlight effect)

PImage img;

void setup() {
  size(200, 200);
  img = loadImage( "sunflower.jpg" );
}

void draw() {
  loadPixels();
  img.loadPixels();
 
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*img.width;

      // Get the R,G,B values from image
      float r = red  (img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue (img.pixels[loc]);

      // Calculate proximity to the mouse
      float distance = dist(x, y, mouseX, mouseY);
      
      // adjust R based on mouseX - when it is towards right, make brighter
      float adjustBrightnessR = map(mouseX, 0, width, 1, 5);
      
      // adjustG based on mouseY - when it is towards bottom, make brither
      float adjustBrightnessG = map(mouseY, 0, height, 1, 5);
      
      // adjust B based on dist from mouse (x and y combined)
      float adjustBrightnessB = map(distance, 0, 50, 8, 0);
            
      r *= adjustBrightnessR;
      g *= adjustBrightnessG;
      b *= adjustBrightnessB;

      // Constrain RGB to between 0-255
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }

  updatePixels();
}