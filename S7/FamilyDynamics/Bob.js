// BOB
function Bob(x, y, imgID) {
  this.position = createVector(x, y);
  this.velocity = createVector(0, 0);
  this.acceleration = createVector(0, 0);

  this.mass = 10;

  // For mouse interaction
  this.dragging = false;

  // Arbitrary damping to simulate friction / drag
  this.damping = 0.98;

  this.img = loadImage("images/face" + imgID + ".png");
}

// Standard Euler integration
Bob.prototype.update = function() {
  this.velocity.add(this.acceleration);
  this.velocity.mult(this.damping);
  this.position.add(this.velocity);
  this.acceleration.mult(0);
}

// Newton's law: F = M * A
Bob.prototype.applyForce = function(force) {
  var f = force.copy();
  f.div(this.mass);
  this.acceleration.add(f);
}


// Draw the bob
Bob.prototype.display = function() {
  imageMode(CENTER);
  image(this.img, this.position.x, this.position.y);
}

Bob.prototype.checkEdges = function() {
    if (this.position.x > width) {
      this.position.x = width;
      this.velocity.x *= -1;
    } else if (this.position.x < 0) {
      this.position.x = 0;
      this.velocity.x *= -1;
    }

    if (this.position.y > height) {
      this.position.y = height;
      this.velocity.y *= -1;
    }
    else if (this.position.y < 0) {
      this.position.y = 0;
      this.velocity.y *= -1;
    }
}

// The methods below are for mouse interaction

// This checks to see if we clicked on the mover
Bob.prototype.clicked = function(mx, my) {
  var d = dist(mx, my, this.position.x, this.position.y);
  if (d < 100) {
    this.dragging = true;
  }
}

Bob.prototype.stopDragging = function() {
  this.dragging = false;
}

Bob.prototype.drag = function() {
  if (this.dragging) {
    this.position.x += mouseX - pmouseX;
    this.position.y += mouseY - pmouseY;
  }
}
