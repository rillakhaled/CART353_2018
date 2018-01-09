boolean white;

void setup() {

  size(500, 500);
  noStroke();
  white = true;

}

void draw() {
  // do a double for loop, drawing alternating black and white rects
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      
      if (white) {
        // set fill color to be white with an opacity of 10 (so it has a fade in effect)
        fill(255, 10);
      } else {
        // set fill color to be black with an opacity of 10 (so it has a fade in effect)
        fill(0, 10);
      }
      // draw a rect at the location determined by i, j, and grid size
      rect(i*50, j*50, 50, 50);
      
      // flip the boolean val of "white"
      white = !white;
    }
    // end of a column, flip the boolean val of "white"
    white = !white;
  }
 
 
 int currentHorizSquare = mouseX / 50;
 int currentVertSquare = mouseY / 50;
 
 if(currentHorizSquare >= 0 && currentHorizSquare <= 7 && currentVertSquare >= 0 && currentVertSquare <= 7) {
   
   fill(255,0,0);
   rect(currentHorizSquare * 50, currentVertSquare * 50, 50, 50);
   
 }
 else {
  println("out of bounds"); 
 }
}