class Image {

  int rows;
  int cols;
  PImage img;
  float xPos;
  float yPos;
  boolean shattered;

  // Each Image instance is associated with a particle system
  ParticleSystem ps;

  Image(String filename) {
    // initialise some variables and render our image on screen
    xPos = random(width/2);
    yPos = random(height/2);
    img = loadImage(filename);
    image(img, xPos, yPos);
    shattered = false;

    rows = 50;
    cols = 50;
  }

  // only show the image if it has not been shattered
  void show() {
    if (!shattered) {
      image(img, xPos, yPos);
    }
  }

  // shatter() initialises our particle system with little squares of image
  ParticleSystem shatter() {
    shattered = true;

    // blockWidth and blockHeight are the dimensions of each little square
    // i.e. the size of each particle
    int blockWidth = img.width/rows;
    int blockHeight = img.height/cols;

    ps = new ParticleSystem();

    // go through the orginal PImage, making many new small PImages for each blockWidth, blockHeight segment  
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        PImage segment = createImage(blockWidth, blockHeight, RGB);
        segment.copy(img, i*blockWidth, j*blockHeight, blockWidth, blockHeight, 0, 0, blockWidth, blockHeight);
        // make a new particle, passing it the new tiny PImage
        ps.addParticle(new PVector(xPos+i*blockWidth, yPos+j*blockHeight), segment);
      }
    }
    // return the resulting particle system
    return ps;
  }

  // has our image been clicked on - simple bounds checking
  boolean clickedOn() {
    if (mouseX >= xPos && mouseX <= xPos + img.width && mouseY >= yPos && mouseY <= yPos + img.width) {
      return true;
    } else {
      return false;
    }
  }
}