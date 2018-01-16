/* SLIDER

Slider uses the mouseX position as a "slider", such
that anything to the left is rendered in black and
white.

*/


PImage source;      // Source image

void setup() {
  size(200, 200);
  source = loadImage("cat1.jpg");
}

void draw() {
  
  // x loc serves as our "slider"
  int x = mouseX;

  source.loadPixels();
  loadPixels();

  for (int i = 0; i < source.width; i++) {
    for (int j = 0; j < source.height; j++) {

      int loc = i + j * source.width;
      color c = source.pixels[loc];
      
      // newc will hold the value of our new color (if we need it)
      int newc = 0;

      // if we are looking at portions of the screen to the left of our slider
      if (i < x) {
        
        // convert c to be in black and white, using color type's brightness method
        newc = (int)brightness(c);
        newc = constrain(newc, 0, 255);

        // NB: another (more cumbersome) way we could have done this is below, 
        // averaging and flattening our r g b vals into a single val
        
        //float r1 = red(c);
        //float g1 = green(c);
        //float b1 = blue(c);
        //newc = (int)(r1+g1+b1)/3;
        //newc = constrain(newc, 0, 255);
        
        pixels[loc] = color(newc);
      } else {
        pixels[loc] = c;
      }
    }
  }

  updatePixels();
  stroke(3);
  line(x, 0, x, height);
}