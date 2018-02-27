/* Rilla's solution for exercise 2.1 in Daniel Shiffman's The Nature of Code 

Exercise 2.1
Using forces, simulate a helium-filled balloon floating upward and bouncing off the top 
of a window. Can you add a wind force that changes over time, perhaps according to Perlin noise?*/

Balloon b;
PVector helium;
PVector ceiling;
float xoff;
float yoff;

void setup() {
  size(600, 400); 

  b = new Balloon();
  helium = new PVector(0, -0.05);
  ceiling = new PVector(0, 0.5);
  xoff = 0.0;
  yoff = 1000.0;
}

void draw() {
  
    // if balloon has "floated" up to the top
  if (b.position.y <= 0) {
    // the ceiling should exert a downwards force: apply the ceiling 
    println("position.x "+b.position.x+" pos y: "+b.position.y);
    println("oldposition.x "+b.oldposition.x+" oldpos y: "+b.oldposition.y);
    println("velocity.x "+b.velocity.x+" vel y: "+b.velocity.y);
    b.applyForce(ceiling);
  }

  // apply our helium vector to the balloon
  b.applyForce(helium);

  // make a new PVector for wind based on Perlin noise (which is changing each frame)
  float windx = map(noise(xoff), 0, 1, -0.001, 0.001);
  float windy = map(noise(yoff), 0, 1, -0.001, 0.001);
  PVector wind = new PVector(windx, windy);

  // apply wind
  b.applyForce(wind);

  b.update();
  b.checkEdges(); 
  b.display();
  xoff += 0.01;
  yoff += 0.01;
}