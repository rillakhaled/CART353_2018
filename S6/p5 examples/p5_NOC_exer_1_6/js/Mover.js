var position;
var velocity;
var acceleration;
var topspeed;
var xoff;
var yoff;

function Mover() {
  position = createVector(windowWidth/2, windowHeight/2);
  velocity = createVector(0, 0);
  acceleration = createVector(0, 0);
  topspeed = 10;
  xoff = 0.0;
  yoff = 1000;
}

  Mover.prototype.update = function() {
    this.setAcceleration();
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
  }

  // obatains a new value for acceleration based on perlin noise
  Mover.prototype.setAcceleration = function() {

    // get a perlin noise val based on xoff for our horiz acceleration, scaled to [-0.05, 0.05]
    acceleration.x = 0.1;
    acceleration.y = 0.1;

    //this.acceleration.x = map(noise(xoff), 0, 1, -0.05, 0.05);

    // get a perlin noise val based on yoff for our vert acceleration, scaled to [-0.05, 0.05]
    //this.acceleration.y = map(noise(yoff), 0, 1, -0.05, 0.05);

    // update xoff and yoff
    xoff += 0.01;
    yoff += 0.01;
  }

  Mover.prototype.display = function() {

    push();
    translate(position.x, position.y);
    rotate(velocity.heading());
    imageMode(CENTER);
    image(car, 0, 0);
    pop();
  }

  // checkEdges wraps position horizontally and vertically
  Mover.prototype.checkEdges = function() {

    if (position.x > windowWidth) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = windowWidth;
    }

    if (position.y > windowHeight) {
      position.y = 0;
    } else if (position.y < 0) {
      position.y = windowHeight;
    }
  }
