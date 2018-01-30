/* Rilla's solution to exercise I.8 of Daniel Shiffman's Nature of Code

Exercise I.8
Play with color, noiseDetail(), and the rate at which xoff and yoff are incremented to 
achieve different visual effects. */

void setup() {
  size(640, 480);
}

void draw() {

  loadPixels();
  float xoff = 0.0;
  
  // 6 octaves, with each octave having 40% impact of the one immediately below it
  noiseDetail(6, 0.4);

  for (int x = 0; x < width; x++) {
    
    float yoff = 0.0;

    for (int y = 0; y < height; y++) {
      
      // determine separate vals for r, g, b based on variations of xoff and yoff fed into noise
      float r = map(noise(xoff, yoff), 0, 1, 0, 255);
      float g = map(noise(xoff+5, yoff), 0, 1, 0, 200);
      float b = map(noise(xoff, yoff*5), 0, 1, 0, 200);
      
      // put our generated color back into our pixel array
      pixels[x + y*width] = color(r, g, b);
      
      // setting the y increment to be bigger than x increment creates horizontal bands look
      yoff += 0.1;
    }
    xoff += 0.01;
  }
  updatePixels();
}