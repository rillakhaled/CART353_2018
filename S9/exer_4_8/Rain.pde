class Rain extends Particle {

  float topspeed;

  Rain(PVector l) {
    super(l);
    topspeed = 2.0;
  }

  // we override Particle's update method
  void update() {
    velocity.add(acceleration);
    position.add(velocity);

    // let's turn off lifespan decreasing: these raindrops will live forever
    // lifespan -= 2.0;

    // and we add a call to checkEdges, so our raindrops wrap
    checkEdges();
  }

  // we override Particle's display method
  void display() {
    stroke(127, lifespan);
    pushMatrix();
    translate(position.x, position.y);
    rotate(velocity.heading());
    // a raindrop is a line drawn at its velocity angle
    line(0, 0, 10, 0);
    popMatrix();
  }

  // checkEdges() wraps position horizontally + vertically
  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } else if (position.y < 0) {
      position.y = height;
    }
  }
}