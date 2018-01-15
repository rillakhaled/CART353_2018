/* Rilla's solution for exercise 15.3 in Daniel Shiffman's 
Learning Processing

Exercise 15-3: Display an image using tint(). Use the mouse 
location to control the amount of red, green, and blue tint. 
Also try using the distance of the mouse from the corners or 
center. */

PImage handy;

void setup() {
  size(255, 255);
  handy = loadImage("hands.jpg");
}

void draw() {
  /* this version uses mouseX to control quanity of R and 
  mouseY to control quantity of G */
  // tint(constrain(mouseX, 0, 255), mouseY, 0, 100);
  
  /* this version uses: 
  - distance from left top hand corner to determine intensity of G
  - distance from centre to determine intensity of B */
  
  // the dist method takes x1, y1, x2, and y2 and works out the distance between
  // a pair of (x, y) points
  float G = dist(0, 0, mouseX, mouseY);
  
  // constrain it to be max 255
  G = constrain(G, 0, 255);
  
  float B = dist(width/2, height/2, mouseX, mouseY);
  B = constrain(B, 0, 255);
  
  tint(0, G, B, 100);
  image(handy, 0, 0, 255, 255);
}