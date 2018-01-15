// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-10: Brightness threshold

PImage source1;      // Source image
PImage source2;      // Source image

PImage destination; // Destination image

void setup() {
  size(200,200);
  
  source1 = loadImage("cat1.jpg");
  source2 = loadImage("cat2.jpg");
  
  destination = createImage(source1.width, source1.height, RGB);
}

void draw() {
  
  // We are going to look at both image's pixels
  source1.loadPixels();
  source2.loadPixels();
  
  destination.loadPixels();
  
  // both photos are the same size, we'll use source1's deets for both
  for (int x = 0; x < source1.width; x++ ) {
    for (int y = 0; y < source1.height; y++ ) {
      
      int loc = x + y*source1.width;
      color c1 = source1.pixels[loc];
      color c2 = source2.pixels[loc];
      
      // depending on mouseX position, let's vary the amount of overall brightness
      // if it's more to the right, make it higher
      // more to the left, make it more of a regular blend
      float scalingFactor = map(mouseX, 0, width, 2, 0);
      
      float mixedR = (red(c1) + red(c2)) / scalingFactor;
      float mixedG = (green(c1) + green(c2)) / scalingFactor;
      float mixedB = (blue(c1) + blue(c2)) / scalingFactor;
      
      mixedR = constrain(mixedR, 0, 255);
      mixedG = constrain(mixedG, 0, 255);
      mixedB = constrain(mixedB, 0, 255);
      
      destination.pixels[loc] = color(mixedR, mixedG, mixedB);  
      
    }
  }
  
  // We changed the pixels in destination
  destination.updatePixels();
  // Display the destination
  image(destination,0,0);
}