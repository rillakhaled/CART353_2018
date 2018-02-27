class Wave {
  float amplitude; // amplitude, i.e. max height
  float aStartIncrement; // amount to increment starting angle each time draw is called
  float aStart; // our starting angle for each draw frame
  float aIncrement; // angular velocity
  int segments; // how many segments of the wave to draw
  float xoff; // x loc where we start drawing wave from
  float yoff; // y loc around which we oscillate wave

  Wave(float a, float aSI, float aI, int s, float xo, float yo) {
    amplitude = a;
    aStartIncrement = aSI;
    aIncrement = aI;
    segments = s;
    xoff = xo;
    yoff = yo;

    aStart = 0.0;
  }

  void oscillate() {

    // set aStart to be incremented by an appropriate amount (once per draw)
    aStart += aStartIncrement;
    
    // initialise angle a to aStart
    float a = aStart;

    for (int i = 0; i < segments; i++) {
      
      // obtain an x position based on xoff and how far through the segments loop we are
      float x = i * 10 + xoff;
      
      // obtain a y position based on sin(a), yoff and our amplitude
      float y = map(sin(a), -1, 1, yoff-amplitude, yoff+amplitude);
      
      // obtain a color, c, based on sin(a)
      int c = int(map(sin(a), -1, 1, 200, 0));

      stroke(0);
      fill(c, 70);
      noStroke();
      
      // draw an ellipse of the right size and color
      ellipse(x, y, y, y);
      
      // increment the angle a accoridng to angular velocity - aIncrement
      a += aIncrement;
    }
  }
}