function Mover() {
  this.position = createVector(windowWidth/2, windowHeight/2);
  this.velocity = createVector(0, 0);
  this.acceleration = createVector(0, 0);
  this.topspeed = 10;
  this.xoff = 0.0;
  this.yoff = 1000;
}

  Mover.prototype.update = function() {
    this.setAcceleration();
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.topspeed);
    this.position.add(this.velocity);
  }

  // obatains a new value for acceleration based on perlin noise
  Mover.prototype.setAcceleration = function() {

    // get a perlin noise val based on xoff for our horiz acceleration, scaled to [-0.05, 0.05]
    this.acceleration.x = map(noise(this.xoff), 0, 1, -0.05, 0.05);

    // get a perlin noise val based on yoff for our vert acceleration, scaled to [-0.05, 0.05]
    this.acceleration.y = map(noise(this.yoff), 0, 1, -0.05, 0.05);

    // update xoff and yoff
    this.xoff += 0.01;
    this.yoff += 0.01;
  }

  Mover.prototype.display = function() {

    push();
    translate(this.position.x, this.position.y);
    rotate(this.velocity.heading());
    imageMode(CENTER);
    image(car, 0, 0);
    pop();
  }

  // checkEdges wraps position horizontally and vertically
  Mover.prototype.checkEdges = function() {

    if (this.position.x > windowWidth) {
      this.position.x = 0;
    } else if (this.position.x < 0) {
      this.position.x = windowWidth;
    }

    if (this.position.y > windowHeight) {
      this.position.y = 0;
    } else if (this.position.y < 0) {
      this.position.y = windowHeight;
    }
  }
