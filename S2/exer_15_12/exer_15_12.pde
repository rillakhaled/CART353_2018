// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-10: Brightness threshold

PImage source;      // Source image
float xScale;
float yScale;
int frame;
float shapeSize;

void setup() {
  size(900, 545);
  source = loadImage("cat1.jpg");

  xScale = (float)width / float(source.width);
  yScale = (float)height / float(source.height);
  
  frame = 0;
  shapeSize = 20;

}

void draw() {
  int randX = (int)random(source.width);
  int randY = (int)random(source.height);

  int randLoc = randX + randY * source.width;
  
  source.loadPixels();
  color c = source.pixels[randLoc];
  noStroke();
  fill(c);
  
  if(frame % 3 == 0) {
    ellipse(randX * xScale, randY * yScale, shapeSize, shapeSize);
  }
  else if(frame % 3 == 1) {
    rect(randX * xScale, randY * yScale, shapeSize, shapeSize);
  }
  else {
   
    triangle(randX*xScale, randY*yScale, randX*xScale+(shapeSize/2), randY*yScale-shapeSize, randX*xScale+shapeSize, randY*yScale);
  }
  frame++;
}