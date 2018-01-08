class GridSquare {

  int x;
  int y;
  int size;
  int col;
  boolean white;

  GridSquare(int x, int y, int size, boolean white) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.white = white;
  }

  void render() {
    color c;

    int currentHorizSquare = mouseX / 50;
    int currentVertSquare = mouseY / 50;

    if (currentHorizSquare == this.x && currentVertSquare == this.y) {
      c = color(255, 0, 0);
      fill(c, 255);
    } else {
      if (this.white) {
        c = color(255);
      } else {
        c = color(0);
      }
      fill(c, 10);
    }
    rect(this.x * size, this.y * size, size, size);
  }
}