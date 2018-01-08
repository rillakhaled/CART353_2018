boolean white;

GridSquare[][] grid;

void setup() {

  size(500, 500);
  noStroke();
  white = true;
  
  grid = new GridSquare[8][8];
  
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      grid[i][j] = new GridSquare(i, j, 50, white);
      white = !white;
    }
    white = !white;
  }
}

void draw() {

   for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      grid[i][j].render();
    }
  } 
}