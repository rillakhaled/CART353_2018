// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An animated drawing of a Neural Network

class Neuron {
  // Neuron has a position
  PVector position;

  // Neuron has a list of forward connections
  ArrayList<Connection> forwardConnections;

  // It also has a list of backward connections
  ArrayList<Connection> backwardConnections;

  // We now track the inputs and sum them
  float sum = 0;

  // The Neuron's size can be animated
  float r = 32;
  
  // which way are we animating
  boolean forward = true;

  Neuron(float x, float y) {
    position = new PVector(x, y);
    forwardConnections = new ArrayList<Connection>();
    backwardConnections = new ArrayList<Connection>();
  }

  // Add a fwd Connection
  void addForwardConnection(Connection c) {
    forwardConnections.add(c);
  } 

  // Add a bwd Connection
  void addBackwardConnection(Connection c) {
    backwardConnections.add(c);
  } 

  // Receive an input
  void feedforward(float input) {
    // Accumulate it
    sum += input;
    // Activate it?
    if (sum > 1) {
      fire();
      sum = 0;  // Reset the sum to 0 if it fires
      forward = true;
    }
  }

  // Receive an input
  void feedback(float input) {
    // Accumulate it
    sum += input;
    // Activate it?
    if (sum > 1) {
      fire();
      sum = 0;  // Reset the sum to 0 if it fires
      forward = false;
    }
  }


  // The Neuron fires
  void fire() {
    r = 64;   // It suddenly is bigger

    // We send the output through all connections
    if (forward) {
      for (Connection c : forwardConnections) {
        c.feedforward(sum);
      }
    } else {
      for (Connection c : backwardConnections) {
        c.feedback(sum);
      }
    }
  }

  // Draw it as a circle
  void display() {
    stroke(0);
    strokeWeight(1);
    // Brightness is mapped to sum
    float b = map(sum, 0, 1, 255, 0);
    fill(b);
    ellipse(position.x, position.y, r, r);

    // Size shrinks down back to original dimensions
    r = lerp(r, 32, 0.1);
  }
}