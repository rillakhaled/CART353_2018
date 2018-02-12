  function Mover(m, x, y) {
    this.mass = m;
    this.position = createVector(x, y);
    this.velocity = createVector(0, 0);
    this.acceleration = createVector(0, 0);
    this.g = 0.4;
  }

  Mover.prototype.applyForce = function(force) {
    var f = p5.Vector.div(force, this.mass);
    this.acceleration.add(f);
  }

  // our attract method, which takes a mover as well as a multiplier (which impacts on direction)
  Mover.prototype.attract = function(m, multiplier) {

    var force = p5.Vector.sub(this.position, m.position);             // Calculate direction of force
    var distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 20.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                     // Normalize vector (distance doesn't matter here, we just want this vector for direction

    var strength = (this.g * this.mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength * multiplier);                                         // Get force vector --> magnitude * direction

    return force;
  }

  // similar to above but takes a plain vector as an argument, which we can use for the mouse
  Mover.prototype.attractedToMouse = function(v, multiplier) {
    var force = p5.Vector.sub(v, this.position);             // Calculate direction of force
    var distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 20.0);                    // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    var strength = (this.g * this.mass * 20.0) / (distance * distance); // let's say mouse mass is 20
    force.mult(strength * multiplier);                                         // Get force vector --> magnitude * direction

    return force;
  }

  Mover.prototype.update = function() {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    this.acceleration.mult(0.0);
  }

  Mover.prototype.display = function() {
    noStroke();
    fill(0, 100);
    ellipse(this.position.x, this.position.y, this.mass*24, this.mass*24);
  }
