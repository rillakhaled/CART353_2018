// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// An animated drawing of a Neural Network

class Network {
  
  // The Network has a list of neurons
  ArrayList<Neuron> neurons;
  
  // The Network now keeps a duplicate list of all Connection objects.
  // This makes it easier to draw everything in this class
  ArrayList<Connection> connections;
  PVector position;

  Network(float x, float y) {
    position = new PVector(x, y);
    neurons = new ArrayList<Neuron>();
    connections = new ArrayList<Connection>();
  }

  // We can add a Neuron
  void addNeuron(Neuron n) {
    neurons.add(n);
  }

  // We can connection two Neurons
  void connect(Neuron a, Neuron b, float weight) {
    Connection c = new Connection(a, b, weight);
    a.addForwardConnection(c);
    b.addBackwardConnection(c);
    // Also add the Connection here
    connections.add(c);
  } 
  
  // Sending an input to the first Neuron
  // We should do something better to track multiple inputs
  void feedforward(float input) {
    Neuron start = neurons.get(0);
    start.feedforward(input);
  }
  
    // Sending an input to the first Neuron
  // We should do something better to track multiple inputs
  void feedback(float input) {
    Neuron start = neurons.get(neurons.size()-1);
    start.feedback(input);
  }
  
  // Update the animation
  void update() {
    for (Connection c : connections) {
      c.update();
    }
  }
  
  // Draw everything
  void display() {
    pushMatrix();
    translate(position.x, position.y);
    for (Neuron n : neurons) {
      n.display();
    }

    for (Connection c : connections) {
      c.display();
    }
    popMatrix();
  }
}