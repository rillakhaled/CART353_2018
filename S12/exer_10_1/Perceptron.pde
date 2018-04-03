// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com

// Simple Perceptron Example
// See: http://en.wikipedia.org/wiki/Perceptron

// Perceptron Class

class Perceptron {
  float[] weights;  // Array of weights for inputs
  float c;          // learning constant

  DNA dna;
  float fitness;

  float currentError = 0;

  // Perceptron is created with n weights and learning constant
  Perceptron(int n, float c_, DNA d) {
    weights = new float[n];
    // Start with random weights
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
    c = c_;
    dna = d;
  }

  // Function to train the Perceptron based on a GA
  // rename to fitness?
  void classify(float[] inputs, int desired) {
    // get our current best guess
    int guess = feedforward(inputs);

    // fitness is based on error, the diff. between desired and guess
    float error = desired - guess;

    // as this can be 0, -2, or 2 (with -2 and 2 being worse), let's square it
    error = error * error;

    // save this into currentError
    currentError += error;
  }

  void fitness() {

    if (currentError == 0) {
      currentError = 1;
    }

    fitness = 1/currentError;
  }

  // Guess -1 or 1 based on input values
  int feedforward(float[] inputs) {
    // Sum all values
    float sum = 0;
    for (int i = 0; i < dna.genes.length; i++) {
      sum += inputs[i]*dna.genes[i];
    }
    // Result is sign of the sum, -1 or 1
    return activate(sum);
  }

  int activate(float sum) {
    if (sum > 0) return 1;
    else return -1;
  }

  // Return weights
  float[] getWeights() {
    return dna.genes;
  }


  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  void display(Trainer[] training) {

    // Draw the line based on the current weights
    // Formula is weights[0]*x + weights[1]*y + weights[2] = 0
    /*stroke(0);
     strokeWeight(1);
     float[] weights = ptron.getWeights();
     x1 = xmin;
     y1 = (-dna.genes[2] - dna.genes[0]*x1)/dna.genes[1];
     x2 = xmax;
     y2 = (-dna.genes[2] - dna.genes[0]*x2)/dna.genes[1];
     line(x1, y1, x2, y2);*/

    // Does not use the "known" correct answer
    for (int i = 0; i < training.length; i++) {
      stroke(0);
      strokeWeight(1);
      fill(0);
      int guess = feedforward(training[i].inputs);
      if (guess > 0) {
        noFill();
      }
      ellipse(training[i].inputs[0], training[i].inputs[1], 8, 8);
    }
  }
}