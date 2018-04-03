/* Rilla's solution to exercise 10.1 from Nature of Code
 
 Exercise 10.1
 Instead of using the supervised learning model above, can you train the 
 neural network to find the right weights by using a genetic algorithm? */

// Simple Perceptron Example
// See: http://en.wikipedia.org/wiki/Perceptron

// Code based on text "Artificial Intelligence", George Luger

// A list of points we will use to "train" the perceptron
Trainer[] training = new Trainer[500];

float mutationRate;
Population population;

// We will train the perceptron with one "Point" object at a time
int count = 0;

// Coordinate space
float xmin = -400;
float ymin = -100;
float xmax =  400;
float ymax =  100;

// The function to describe a line 
float f(float x) {
  return 0.4*x+1;
}

void setup() {
  size(640, 360);

  mutationRate = 0.01;

  population = new Population(mutationRate, 5);

  // Create a random set of training points and calculate the "known" answer
  for (int i = 0; i < training.length; i++) {
    float x = random(xmin, xmax);
    float y = random(ymin, ymax);
    int answer = 1;
    if (y < f(x)) answer = -1;
    training[i] = new Trainer(x, y, answer);
  }
  smooth();
}


void draw() {
  background(255);
  translate(width/2, height/2);

  // Draw the line
  strokeWeight(4);
  stroke(127);
  float x1 = xmin;
  float y1 = f(x1);
  float x2 = xmax;
  float y2 = f(x2);
  line(x1, y1, x2, y2);

  // get every perceptron to run on the training set
  population.classify(training);
  population.fitness();
  population.selection();
  population.displayFittest(training);
  population.reproduction();
  
}