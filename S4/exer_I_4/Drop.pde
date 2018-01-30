class Drop {
  
  // current location
  float x;
  float y;
  
  // std dev and mean for the location
  int sd;
  int m;
  
  // for generating color vals
  int r;
  int g;
  int b;
  
  // standard deviation and median information for colors
  float color_sd;
  float color_m;
  
  Random generator;
  
 Drop (int std_dev, int mean) {
   sd = std_dev;
   m = mean;
   
   color_sd = 35;
   color_m = 127;
   
   generator = new Random();
   
 }
 
 // establish a new location and a new color using our means and std devs
 void regenerate() {
   // get new location based on nextGaussian and using our location sd and m
   x = (float)generator.nextGaussian() * sd + m;
   y = (float)generator.nextGaussian() * sd + m;
   
   // generate r,g,b values for us using nextGaussian and our color_m (127) and color_sd (35)
   r = (int)(generator.nextGaussian() * color_sd + color_m);
   g = (int)(generator.nextGaussian() * color_sd + color_m);
   b = (int)(generator.nextGaussian() * color_sd + color_m);
   
   color c = color(r, g, b, 100);
   fill(c);
 }
 
 // display an individual "drop"
 void display() {
   noStroke();
   ellipse(x, y, 20, 20);
 }
}