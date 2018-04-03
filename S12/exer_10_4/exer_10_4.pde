/* Exercise 10.4
Try different rules for reinforcement learning. What if some targets are desirable and some are undesirable? */

// A Vehicle controlled by a Perceptron

Vehicle v;

PVector desired;

ArrayList<PVector> targets;
ArrayList<PVector> antitargets;

void setup() {
  size(640, 360);
  // The Vehicle's desired position
  desired = new PVector(width/2,height/2);

  
  // Create a list of targets
  makeTargets();
  
  // Create the Vehicle (it has to know about the number of targets
  // in order to configure its brain)
  v = new Vehicle(targets.size()+antitargets.size(), random(width), random(height));
}

// Make a random ArrayList of targets to steer towards
void makeTargets() {
  targets = new ArrayList<PVector>();
  for (int i = 0; i < 8; i++) {
    targets.add(new PVector(random(width), random(height)));
  }
  antitargets = new ArrayList<PVector>();
  for (int i = 0; i < 8; i++) {
    antitargets.add(new PVector(random(width), random(height)));
  }
}

void draw() {
  background(255);

  // Draw a circle to show the Vehicle's goal
  stroke(0);
  strokeWeight(2);
  fill(0, 100);
  ellipse(desired.x, desired.y, 36, 36);

  // Draw the targets
  int count = 0;
  for (PVector target : targets) {
    float w = v.brain.weights[count];
    color c = color(int(map(w, 0, 1, 0, 255)));
    fill(c);
    stroke(0);
    strokeWeight(2);
    ellipse(target.x, target.y, 16, 16);
    line(target.x,target.y-16,target.x,target.y+16);
    line(target.x-16,target.y,target.x+16,target.y);
    count++;
  }
  for (PVector target : antitargets) {
    float w = v.brain.weights[count];
    color c = color(int(map(w, 0, 1, 0, 255)));
    fill(c);
    stroke(255, 0, 0);
    strokeWeight(2);
    ellipse(target.x, target.y, 16, 16);
    line(target.x,target.y-16,target.x,target.y+16);
    line(target.x-16,target.y,target.x+16,target.y);
    count++;
  }
  
  // Update the Vehicle
  v.steer(targets, antitargets);
  v.update();
  v.display();
}

void mousePressed() {
  makeTargets();
}