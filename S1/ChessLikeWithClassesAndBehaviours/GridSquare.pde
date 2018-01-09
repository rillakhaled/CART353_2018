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

    // establish a random amount of food to start with
    this.food = random(500, 1000);

    if (white) {
      this.col = 255;
    } else {
      this.col = 0;
    }
  }

  void render() {

    // if it is a black square
    if (!this.white) {

      // reflect the amount of food
      col = (int)map(this.food, 0, 1000, 255, 0);

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
      this.food += 10;
      
    }
  }
}