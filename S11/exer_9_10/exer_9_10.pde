/* Rilla's solution for exercise 9.10 in Daniel Shiffman's Nature of Code based
on his Smart Rockets code from example 9.3 

Exercise 9.10
Visualize the rockets differently. Can you draw a line for the shortest path to the target? 
Can you add particle systems that act as smoke in the direction of the rocket thrusters? */

// Smart Rockets w/ Genetic Algorithms

// Each Rocket's DNA is an array of PVectors
// Each PVector acts as a force for each frame of animation
// Imagine an booster on the end of the rocket that can point in any direction
// and fire at any strength every frame

// The Rocket's fitness is a function of how close it gets to the target as well as how fast it gets there

// This example is inspired by Jer Thorp's Smart Rockets
// http://www.blprnt.com/smartrockets/

int lifetime;  // How long should each generation live

Population population;  // Population

int lifecycle;          // Timer for cycle of generation
int recordtime;         // Fastest time to target

Target target;        // Target position

//int diam = 24;          // Size of target

ArrayList<Obstacle> obstacles;  //an array list to keep track of all the obstacles!

void setup() {
  size(640, 360);
  smooth(4);
  // The number of cycles we will allow a generation to live
  lifetime = 300;

  // Initialize variables
  lifecycle = 0;
  recordtime = lifetime;

  target = new Target(width/2-12, 24, 24, 24);

  // Create a population with a mutation rate, and population max
  float mutationRate = 0.01;
  population = new Population(mutationRate, 50);

  // Create the obstacle course  
  obstacles = new ArrayList<Obstacle>();
  obstacles.add(new Obstacle(width/2-100, height/2, 200, 15));
  obstacles.add(new Obstacle(random(width), random(100, height), random(100), 15));
  obstacles.add(new Obstacle(random(width), random(100, height), random(100), 15));
}

void draw() {
  background(0);

  // If the generation hasn't ended yet
  if (lifecycle < lifetime) {
    population.live(obstacles);
    if ((population.targetReached()) && (lifecycle < recordtime)) {
      recordtime = lifecycle;
    }
    lifecycle++;
    // Otherwise a new generation
  } else {

    lifecycle = 0;
    population.fitness();
    population.selection();
    population.reproduction();
  }

  // Draw the target positions
  target.display();
  
  // Draw the obstacles
  for (Obstacle obs : obstacles) {
    obs.display();
  }

  // Display some info
  fill(255);
  text("Generation #: " + population.getGenerations(), 10, 18);
  text("Cycles left: " + (lifetime-lifecycle), 10, 36);
  text("Record cycles: " + recordtime, 10, 54);
}

// Move the target if the mouse is pressed
// System will adapt to new target
void mousePressed() {
  target.position.x = mouseX;
  target.position.y = mouseY;

  recordtime = lifetime;
}