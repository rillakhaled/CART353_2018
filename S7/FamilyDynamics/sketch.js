var blackboard;
var bobs;
var springs;

function preload() {
  blackboard = loadImage("images/blackBoard.jpg");
}

function setup() {
  createCanvas(600, 450);
  background(255);
  this.bobs = [];
  this.springs = [];

  this.bobs[0] = new Bob(width / 2, 100, 0);
  this.bobs[1] = new Bob(100, 200, 1);
  this.bobs[2] = new Bob(width - 100, 200, 2);

  this.springs[0] = new Spring(bobs[0], bobs[1], 200);
  this.springs[1] = new Spring(bobs[1], bobs[2], 200);
  this.springs[2] = new Spring(bobs[2], bobs[0], 220);

}

function draw() {
  background(255);
  image(blackboard, width / 2, height / 2);

  for (var i = 0; i < this.springs.length; i++) {
    this.springs[i].connections();
  }

  for (var j = 0; j < this.bobs.length; j++) {
    this.bobs[j].update();
    this.bobs[j].checkEdges();
    this.bobs[j].drag();
    this.bobs[j].display();
  }
}

// For mouse interaction with bob
function mousePressed() {
  for (var j = 0; j < bobs.length; j++) {
    bobs[j].clicked(mouseX, mouseY);
  }
}

function mouseReleased() {
  for (var j = 0; j < bobs.length; j++) {
    bobs[j].stopDragging();
  }
}


