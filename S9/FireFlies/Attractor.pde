// Based on the Repeller class mashed up with Shiffman's Pendulum class from NOC example 3.10
class Attractor {

  float multiplier; // strength of attraction based on whether light on or off

  // position
  PVector position;     // position of bulb
  PVector origin;       // position of arm origin
  float r = 10;        // Length of arm

  float angle;         // Arm angle
  float aVelocity;     // Angle velocity
  float aAcceleration; // Angle acceleration

  float ballr;         // Ball radius
  float damping;       // Arbitary damping amount

  boolean dragging = false;
  boolean bulbIsOn = false;

  // Bulb image by Andres Flores from the Noun Project
  PImage bulbOff;
  PImage bulbOn;  

  boolean playingBugSound;

  Minim minim;
  AudioPlayer bulb;
  AudioPlayer bug;

  Attractor(PVector _o, float armLength, Minim m) {
    origin = _o.get();
    position = new PVector();

    angle = 0;
    r = armLength;
    ballr = 150;
    multiplier = -10;
    aVelocity = 0.0;
    aAcceleration = 0.0;
    damping = 0.995;   // Arbitrary damping

    minim = m;

    bulbOff = loadImage("bulbOff.png");
    bulbOn = loadImage("bulbOn.png");

    bulb = minim.loadFile("bulbBuzzShortMono.wav", 1024);
    bulb.loop();
    bulb.mute();
    bug = minim.loadFile("hit2.mp3", 1024);
  }

  void go() {
    update();
    drag();    //for user interaction
    display();
  }

  // Function to update position
  void update() {
    // As long as we aren't dragging the bulb, let it swing!
    if (!dragging) {
      float gravity = 0.4;                              // Arbitrary constant
      aAcceleration = (-1 * gravity / r) * sin(angle);  // Calculate acceleration (see: http://www.myphysicslab.com/pendulum1.html)
      aVelocity += aAcceleration;                 // Increment velocity
      aVelocity *= damping;                       // Arbitrary damping
      angle += aVelocity;                         // Increment angle
    }
  }

  void display() {

    position.set(r*sin(angle), r*cos(angle), 0);         // Polar to cartesian conversion
    position.add(origin);                              // Make sure the position is relative to the pendulum's origin

    stroke(0);
    strokeWeight(8);
    // Draw the arm
    line(origin.x, origin.y, position.x, position.y);

    pushMatrix();
    translate(position.x, position.y);
    rotate(-angle);

    // draw the appropriate bulb image: on or off
    if (bulbIsOn) {
      image(bulbOn, 0, r*0.4);
    } else {
      image(bulbOff, 0, r*0.4);
    }

    popMatrix();
  }


  // when the bulb is on, there is a pull force
  // when it is off, there is a repel force
  PVector attract(Particle p) {

    PVector bulbCenter = new PVector(position.x, position.y+90);

    PVector dir = PVector.sub(bulbCenter, p.position);      // Calculate direction of force
    float d = dir.mag();                       // Distance between objects
    dir.normalize();                           // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    d = constrain(d, 5, 200);                    // Keep distance within a reasonable range

    if (d == 5) {
      playCollisionSound();
    }

    float force = multiplier / d;            // attract / repel strength
    dir.mult(force);                           // Get force vector --> magnitude * direction
    return dir;
  }  

  void playCollisionSound() {
    if (bug.position() >= 0) {
      bug.rewind();
      bug.play();
    } else {
      bug.play();
    }
  }

  void triggerBulbSound() {
    bulb.unmute();
  }

  void stopBulbSound() {
    bulb.mute();
  }

  // The methods below are for mouse interaction

  // This checks to see if we clicked on the pendulum ball
  void clicked(int mx, int my) {

    bulbIsOn = !bulbIsOn;

    if (bulbIsOn) {
      multiplier = 50;
      // play the bulb sound
      triggerBulbSound();
    } else {
      multiplier = -10;
      stopBulbSound();
    }

    float d = dist(mx, my, position.x, position.y);
    if (d < ballr) {
      dragging = true;
    }
  }

  // This tells us we are not longer clicking on the ball
  void stopDragging() {
    aVelocity = 0; // No velocity once you let go
    dragging = false;
  }

  void drag() {
    // If we are draging the ball, we calculate the angle between the 
    // pendulum origin and mouse position
    // we assign that angle to the pendulum
    if (dragging) {
      PVector diff = PVector.sub(origin, new PVector(mouseX, mouseY));      // Difference between 2 points
      angle = atan2(-1*diff.y, diff.x) - radians(90);                      // Angle relative to vertical axis
    }
  }
}