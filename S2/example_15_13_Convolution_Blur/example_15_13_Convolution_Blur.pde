// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-13: Sharpen with convolution

PImage img;
int w = 80;


// remember that we need to involve decimals in our float calculation to remind Processing that this is a float
float blurVal = 1.0/9.0;

// The convolution matrix for a "blur" effect stored as a 3 x 3 two-dimensional array.
float[][] matrixBlur = {{ blurVal, blurVal, blurVal } , 
                       { blurVal, blurVal, blurVal } ,
                       { blurVal, blurVal, blurVal }} ;

void setup() {
  size(200,200);
  img = loadImage( "sunflower.jpg" );
}

void draw() {
  
  // We're only going to process a portion of the image
  // so let's set the whole image as the background first
  image(img,0,0);
  
  // In this example we are only processing a section of the image-an 80 x 80 rectangle around the mouse location
  // constrained by the window
  int xstart = constrain(mouseX-w/2,0,img.width); 
  int ystart = constrain(mouseY-w/2,0,img.height);
  int xend = constrain(mouseX + w/2,0,img.width);
  int yend = constrain(mouseY + w/2,0,img.height);
  int matrixsize = 3;
  
  loadPixels();
  // Begin our loop for every pixel
  for (int x = xstart; x < xend; x++ ) {
    for (int y = ystart; y < yend; y++ ) {
      // Each pixel location (x,y) gets passed into a function called convolution()
      // The convolution() function returns a new color to be displayed.
      color c = convolution(x, y, matrixBlur, matrixsize,img); 
      int loc = x + y*img.width;
      pixels[loc] = c;
    }
  }
  updatePixels();
  stroke(0);
  noFill();
  rect(xstart,ystart,xend-xstart,yend-ystart);
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
  
  // set our totals to 0 to begin with: we will add them as we cycle through our matrix
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  
  // by using offset, we can look "around" a particular pixel
  int offset = matrixsize / 2;
  
  // Loop through convolution matrix
  for (int i = 0; i < matrixsize; i++ ) {
    for (int j = 0; j < matrixsize; j++ ) {
      
      // the pixel we are passed location info on is (x, y)
      // we use i, j, and offset to look at the pixels above, below, to the left, etc.
      // [][]    []
      // [][x, y][]
      // [][]    []
      
      int xloc = x + i-offset;
      int yloc = y + j-offset;
      int loc = xloc + img.width*yloc;
      
      // Make sure we haven't walked off the edge of the pixel array
      // It is often good when looking at neighboring pixels to make sure we have not gone off the edge of the pixel array by accident.
      loc = constrain(loc, 0, img.pixels.length-1);
      
      // Calculate the convolution
      // We sum all the neighboring pixels multiplied by the values in the convolution matrix.
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  
  // Make sure RGB is within range
  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);
  
  // Return the resulting color
  return color(rtotal,gtotal,btotal); 
}