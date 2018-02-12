var mover;

// Images
var car // car image from the Noun Project

function preload() {
  car = loadImage('images/car.png');
}

/* just like in Processing, p5 has a setup method where we set things up - including
drawing our canvas */
function setup() {

  //createCanvas(640, 360);
  createCanvas(windowWidth,windowHeight);
  this.mover = new Mover();
}

/* we also have a draw method */
function draw() {
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
}

function windowResized() {
  resizeCanvas(windowWidth,windowHeight);
}
