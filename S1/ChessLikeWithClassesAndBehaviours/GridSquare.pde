class GridSquare {

  int x;
  int y;
  int size;
  int col;
  float food;

  boolean white;

  GridSquare(int x, int y, int size, boolean white) {
    this.x = x;
    this.y = y;
    this.size = size;

    this.white = white;

    this.food = random(500, 1000);

    if (white) {
      this.col = 255;
    } else {
      this.col = 0;
    }
  }

  void draw() {

    // if it is a black square
    if (!this.white) {

      // reflect the amount of food
      col = (int)map(this.food, 0, 1000, 0, 220);

      // we need to kind of invert this number, since black is 0 which in this case means healthy
      col = 220 - col;
    }

    fill(col, 10);
    rect(this.x * size, this.y * size, size, size);
  }

  void update() {
    if(!this.white && this.food > 0) {
      this.food--;
    }
  }

  void feed() {
    if (!this.white && this.food < 1000) {
      this.food += 5;
      
    }
  }
}