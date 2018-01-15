PImage catParty;

void setup() {
  catParty = loadImage("djCat.gif");
  size(400, 400);
}

void draw() {
  background(255);

  // example: catParty follows the mouse
  // image(catParty, mouseX, mouseY);

  // example: catParty's W and H is determined by mouse location 
  image(catParty, 0, 0, mouseX, mouseY);
}