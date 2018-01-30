/* Rilla's solution to exercise I.9 of Daniel Shiffman's Nature of Code

Exercise I.9
Add a third argument to noise that increments once per cycle through draw() 
to animate the two-dimensional noise. */

float zoff;

void setup() {
  size(640, 480);
  
  // zoff will be the 3rd argument passed into noise
  zoff = 1000.0;
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
      float r = map(noise(xoff, yoff, zoff), 0, 1, 0, 255);
      float g = map(noise(xoff+5, yoff, zoff), 0, 1, 0, 200);
      float b = map(noise(xoff, yoff*5, zoff), 0, 1, 0, 200);
      
      pixels[x + y*width] = color(r, g, b);
      
      // setting the y increment to be bigger than x increment creates horizontal bands look
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  updatePixels();
  
  // update zoff once per draw cycle
  zoff += 0.03;
}