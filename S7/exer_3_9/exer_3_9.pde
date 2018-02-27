/* Rilla's solution for exercise 3.9 in Daniel Shiffman's The Nature of Code 

Exercise 3.9
Try using the Perlin noise function instead of sine or cosine with the above example. */


float startT = 0.01;

void setup() {
  size(640, 360);
}

void draw() {
  background(255);

  // as with angles + example 3.9, we need a separate variable to track startT
  // we increment it once at the start of each draw loop
  startT += 0.01;
  
  // then use it to intialise a different variable for t
  float t = startT;

  for (int x = 0; x <= width; x += 24) {
    
    // using noise on t and the map function, generate a vertical position: y
    float y = map(noise(t), 0, 1, 0, height);
    
    // draw an ellipse there
    stroke(0);
    fill(0, 50);
    strokeWeight(2);
    ellipse(x, y, 48, 48);
    
    // each loop iteration, update t by 0.03
    t += 0.03;
  }
}