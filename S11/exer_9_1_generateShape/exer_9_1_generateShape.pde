/* Rilla's solution for exercise 9.1 in Daniel Shiffman's Nature of Code

Exercise 9.1
Create a sketch that generates random strings. We’ll need to know how to do this in order 
to implement the genetic algorithm example that will shortly follow. How long does it take 
for Processing to randomly generate the string “cat”? How could you adapt this to generate 
a random design using Processing’s shape-drawing functions? */

ArrayList<PVector> vertices;
boolean darkening = false;
int bgCol = 0;
int frames;

void setup() {
  size(600, 400);
}

void draw() {
  frames++;
  if (frames % 10 == 0) {
    background(bgCol);

    if (darkening) {
      bgCol--;
      if (bgCol == 0) {
        darkening = false;
      }
    } else {
      bgCol++;
      if (bgCol == 100) {
        darkening = true;
      }
    }

    vertices = new ArrayList<PVector>();

    // determine a random number of sides
    int numSides = int(random(3, 9));

    // now our task is to generate numSides number of vertices
    for (int i = 0; i < numSides; i++) {
      float randX = random(width);
      float randY = random(height);
      PVector vertex = new PVector(randX, randY);
      vertices.add(vertex);
    }

    // now we have to go through the arraylist, drawing lines
    strokeWeight(20);
    stroke(255);

    // connect every point to the point listed just before it
    for (int i = 1; i < vertices.size(); i++) {
      line(vertices.get(i-1).x, vertices.get(i-1).y, vertices.get(i).x, vertices.get(i).y);
    }

    // this last line call connects last point in the list to the first
    line(vertices.get(vertices.size()-1).x, vertices.get(vertices.size()-1).y, vertices.get(0).x, vertices.get(0).y);
  }
}