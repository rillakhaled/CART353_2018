

// SPRING
function Spring(b_1, b_2, l) {

  this.b1 = b_1;
  this.b2 = b_2;
  this.len = l;
  this.k = 0.01;
}

// connections method establishes spring's force on both bobs it is connected to
Spring.prototype.connections = function() {
  this.connect(this.b1, this.b2);
  this.connect(this.b2, this.b1);
}

// Calculate spring force
Spring.prototype.connect = function(b1, b2) {

  // Vector pointing from anchor to bob position
  var force = p5.Vector.sub(this.b1.position, this.b2.position);
  // What is distance
  var d = force.mag();
  // Stretch is difference between current distance and rest length
  var stretch = d - this.len;

  // Calculate force according to Hooke's Law
  // F = k * stretch
  force.normalize();
  force.mult(-1 * this.k * stretch);
  this.b1.applyForce(force);
}

Spring.prototype.displayLine = function() {
  strokeWeight(2);
  stroke(0);
  line(this.b1.position.x, this.b1.position.y, this.b2.position.x, this.b2.position.y);
}