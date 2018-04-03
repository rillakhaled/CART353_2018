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
  PVector sender;
  
  // Need to store the output for when its time to pass along
  float output = 0;

  Connection(Neuron from, Neuron to, float w) {
    weight = w;
    a = from;
    b = to;
  }

  // The Connection is active - we are feeding back, moving from B to A
  void feedback(float val) {
    output = val*weight;        // Compute output
    sender = b.position.get();  // Start animation at Neuron B
    sending = true;             // Turn on sending
    forwardDirection = false;
  }
  
  // The Connection is active - we are feeding forward, from A to B
  void feedforward(float val) {
    output = val*weight;        // Compute output
    sender = a.position.get();  // Start animation at Neuron A
    sending = true;             // Turn on sending
    forwardDirection = true;
  }
  
  // Update traveling sender
  void update() {
    if (sending) {
      // Use a simple interpolation
      if(forwardDirection) {
      sender.x = lerp(sender.x, b.position.x, 0.1);
      sender.y = lerp(sender.y, b.position.y, 0.1);
      float d = PVector.dist(sender, b.position);
      // If we've reached the end
      if (d < 1) {
        // Pass along the output!
        b.feedforward(output);
        sending = false;
      }
      }
      else {
              sender.x = lerp(sender.x, a.position.x, 0.1);
      sender.y = lerp(sender.y, a.position.y, 0.1);
      float d = PVector.dist(sender, a.position);
      // If we've reached the end
      if (d < 1) {
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
      ellipse(sender.x, sender.y, 16, 16);
    }
  }
}