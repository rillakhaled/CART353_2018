class Mover {

  // The Mover tracks position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;

  // The Mover's maximum speed
  float topspeed;

  Mover() {
    // Start in the center
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 10;
  }

  void update() {

    // Compute a new vector - acceleration - that gives us a direction
    // i.e. it points from position to mouse
    PVector mouse = new PVector(mouseX, mouseY);
    PVector acceleration = PVector.sub(mouse, position);

    // distance is how far away Mover's position is from the mouse, i.e. acceleration's magnitude
    float distance = acceleration.mag();

    // we will use distance to determine acceleration's new magnitude

    // first of all, constrain it to be between 0 and 600
    distance = constrain(distance, 0, 600);

    // next, do a mapping, so that the larger distance is, the bigger our mapped number, accelMag
    // i.e. when Mover is further away, accelMag should be bigger
    //float accelMag = map(distance, 0, 600, 0, 1);

    // alternatively, do the opposite: when distance is smaller, accelMag should be bigger
    float accelMag = map(distance, 0, 600, 1, 0);

    // normalise acceleration
    acceleration.normalize();

    // multiply it by our magnitude
    acceleration.mult(accelMag);

    // Velocity changes according to acceleration
    velocity.add(acceleration);

    println("accelMag: "+accelMag+ " distance: "+distance+" velocity: "+velocity.mag()); 

    // Limit the velocity by topspeed
    velocity.limit(topspeed);

    // position changes by velocity
    position.add(velocity);
  }


  // checkEdges() constrains position horizontally and vertically
  void checkEdges() {

    if (position.x > width) {
      position.x = width;
    } else if (position.x < 0) {
      position.x = 0;
    }

    if (position.y > height) {
      position.y = height;
    } else if (position.y < 0) {
      position.y = 0;
    }
  }


  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, 48, 48);
  }
}