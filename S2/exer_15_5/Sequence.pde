class Sequence {

  // weird things happen if you declare these variables outside
  // of the Sequence class curly braces!

  PImage[] images;
  int maxImages = 10; // Total # of images
  int imageIndex = 0; // Initial image to be displayed is the first

  int x;
  int y;

  Sequence(int x, int y, int index) {
    // note the use of "this." here and what happens if we use just x and y
    this.x = x;
    this.y = y;
    imageIndex = index;

    images = new PImage[maxImages];

    for (int i = 0; i < images.length; i ++ ) {
      images[i] = loadImage( "animal" + i + ".jpg" );
    }
  }

  void progress() {
    imageIndex = (imageIndex + 1) % images.length;
  }

  void display() {
    image(images[imageIndex], x, y);
  }
}