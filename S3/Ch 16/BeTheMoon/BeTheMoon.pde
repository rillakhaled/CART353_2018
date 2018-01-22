import processing.video.*;

// Variable for capture device
Capture video;

// our background with clouds
PImage background;

// an image of the moon
PImage moonFaceEmpty;

// is the moon waxing (growing) or waning (shrinking)
boolean wax;

// how big to draw the moon
int size;


void setup() {

  size(640, 480);

  background = loadImage("backgroundOnlyWithHole.png");

  moonFaceEmpty = loadImage("moonFaceBlankWindowSize.png");

  video = new Capture(this, 640, 480); 
  video.start();

  wax = true;
  size = 640;
}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

void draw() {

  moonFaceEmpty.loadPixels();
  video.loadPixels();

  // create a new 200x200 image to be a composite img of the moon + what the camera sees
  PImage moonCombo = createImage(640, 480, RGB);
  moonCombo.loadPixels();

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {

      // what is the 1D pixel location
      int loc = x + y*video.width; 

      // now find out how far away this point is from the centre of the screen 
      float d = dist(x, y, width/2, height/2);

      // if we are looking at video pixels that are within 97 pixels from the centre of the screen
      if (d < 97) {

        // we are in a moon face zone!

        // what is the color being picked up on video
        color fgColor = video.pixels[loc]; 

        // what is the color on the moon
        color bgColor = moonFaceEmpty.pixels[loc];

        // get a color that is greyscale and combines video image and moon image
        float greyscaleCamImg = brightness(fgColor);
        float greyscaleMoonImg = brightness(moonFaceEmpty.pixels[loc]);
        float mixed = constrain((greyscaleCamImg+greyscaleMoonImg)/2, 0, 255);

        // put it in moonCombo's pixel array
        moonCombo.pixels[loc] = color(mixed);
      }
    }
  }
  moonCombo.updatePixels();

  // if waxing, the moon should grow bigger
  if (wax) {
    size++;
    if (size == 800) {
      wax = false;
    }
  }
  // else the moon is waning, so it should grow smaller
  else {
    size--;
    if (size == 640) {
      wax = true;
    }
  }

  // resize our moon
  moonCombo.resize(size, 0);

  // draw it such that it is centred
  image(moonCombo, (640-moonCombo.width)/2, (480-moonCombo.height)/2);

  // now add on the Melies night sky
  image(background, 0, 0);
}