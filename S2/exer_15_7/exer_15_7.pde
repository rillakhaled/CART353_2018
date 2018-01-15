PImage img;

void setup() {
  size(600, 600);
  img = loadImage("kasper.jpg");
  frameRate = 5;
}
void draw() {
  
  // load the screen pixels
  loadPixels();
  
  // load the image's pixels
  img.loadPixels();
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y * width;
      float r = red  (img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue (img.pixels[loc]);
      
      // vary R, G, and B values by a random amount in the range of [-50, 50]
      r += random(-50, 50);
      g += random(-50, 50);
      b += random(-50, 50);
      
      // set the new color value in the pixels array
      pixels[loc] = color(r, g, b);
    }
  }
  
  // finally, update the screen pixels
  updatePixels();
}