// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An animated drawing of a Neural Network

class Connection {
  // Connection is from Neuron A to B
  Neuron a;
  Neuron b;

  // Connection has a weight
  float weight;

  // Variables to track the animation
  boolean sending = false;
  boolean forwardDirection = true;

  PVector acceleration;
  PVector velocity;
  PVector position;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

  // Need to store the output for when its time to pass along
  float output = 0;

  Connection(Neuron from, Neuron to, float w) {
    weight = w;
    a = from;
    b = to;
    maxspeed = 3;
    maxforce = 0.2;
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    // need to have an initial position
  }

  // The Connection is active - we are feeding back, moving from B to A
  void feedback(float val) {
    output = val*weight;        // Compute output
    position = b.position.get();  // Start animation at Neuron B
    sending = true;             // Turn on sending
    forwardDirection = false;
  }

  // The Connection is active - we are feeding forward, from A to B
  void feedforward(float val) {
    output = val*weight;        // Compute output
    position = a.position.get();  // Start animation at Neuron A
    sending = true;             // Turn on sending
    forwardDirection = true;
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target

    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force

    return steer;
  }

  // Method to update position
  void update() {
    // Update velocity

    if (sending) {
      PVector steer;
      
      if (forwardDirection) {
        steer = seek(b.position);
      } else {
        steer = seek(a.position);
      }

      acceleration.add(steer);
      velocity.add(acceleration);
      velocity.limit(maxspeed);
      position.add(velocity);
      // Reset accelerationelertion to 0 each cycle
      acceleration.mult(0);

      if (forwardDirection) {
        float d = PVector.dist(position, b.position);
        // If we've reached the end
        if (d < 1) {
          // Pass along the output!
          b.feedforward(output);
          sending = false;
        }
      } else {
        float d = PVector.dist(position, a.position);
        // If we've reached the end
        if (d < 1) {
          // Pass along the output!
          a.feedback(output);
          sending = false;
        }
      }
    }
  }


  // Update traveling sender
  void updateOld() {
    if (sending) {
      if (forwardDirection) {

        float d = PVector.dist(position, b.position);
        // If we've reached the end
        if (d < 2) {
          // Pass along the output!
          b.feedforward(output);
          sending = false;
        }
      } else {

        float d = PVector.dist(position, a.position);
        // If we've reached the end
        if (d < 2) {
          // Pass along the output!
          a.feedback(output);
          sending = false;
        }
      }
    }
  }

  // Draw line and traveling circle
  void display() {
    stroke(0);
    strokeWeight(1+weight*4);

    line(a.position.x, a.position.y, b.position.x, b.position.y);

    if (sending) {
      fill(0);
      strokeWeight(1);
      ellipse(position.x, position.y, 16, 16);
    }
  }
}