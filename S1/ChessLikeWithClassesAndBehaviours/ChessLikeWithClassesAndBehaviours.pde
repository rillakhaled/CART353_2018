boolean white;
GridSquare[][] grid;
int rows;
int cols;
int gridSquareSize;

void setup() {

  size(400, 400);
  noStroke();
  rows = 8;
  cols = 8;
  gridSquareSize = 50;

  grid = new GridSquare[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      grid[i][j] = new GridSquare(i, j, gridSquareSize, white);
      white = !white;
    }
    
    white = !white;
  }
}

void draw() {
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      grid[i][j].update();
      grid[i][j].draw();
    }
  }
  
  
  // do a mouseOver effect

  int currentHorizSquare = mouseX / 50;
  int currentVertSquare = mouseY / 50;

  if (currentHorizSquare >= 0 && currentHorizSquare <= 7 && currentVertSquare >= 0 && currentVertSquare <= 7) {

      grid[currentHorizSquare][currentVertSquare].feed();
      
  }
}