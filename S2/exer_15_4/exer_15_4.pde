/* Rilla's solution for exercise 15.4 in Daniel Shiffman's 
 Learning Processing
 
 Exercise 15-4: Using tint(), create a montage of blended images. 
 What happens when you layer a large number of images, each with 
 different alpha transparency, on top of each other? Can you make 
 it interactive so that different images fade in and out? */

PImage handy;
PImage w1;
PImage w2;

void setup() {
  size(600, 600);
  handy = loadImage("hands.jpg");
  w1 = loadImage("wag1.jpg");
  w2 = loadImage("wag2.jpg");
}

void draw() {

  // handAlpha is determined by dist between top left hand corner and mouse
  float handDist = dist(0, 0, mouseX, mouseY);

  // do a map to get the alpha down to [0, 255]
  int handAlpha = (int)map(handDist, 0, sqrt(width*height), 0, 255);

  // w1Dist is determined by dist from centre and mouse
  float w1Dist = dist(width/2, height/2, mouseX, mouseY);

  // do a map to get the alpha down to [0, 255]
  int w1Alpha = (int)map(w1Dist, 0, sqrt((width/2)*(height/2)), 0, 255);

  // w1Dist is determined by dist from bottom right hand corner and mouse
  float w2Dist = dist(width, height, mouseX, mouseY);

  // do a map to get the alpha down to [0, 255]
  int w2Alpha = (int)map(w2Dist, 0, sqrt(width*height), 0, 255);


  // important: reset the tint after each call to image
  // because tint acts like fill - will apply to anything that follows
  tint(255, handAlpha);
  image(handy, 0, 0);

  tint(255, w1Alpha);
  image(w1, 0, 0);

  tint(255, w2Alpha);
  image(w2, 0, 0);
}