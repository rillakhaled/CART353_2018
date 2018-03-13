// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Smoke Particle System

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are birthed
  PImage img;
  ArrayList<PImage> fire;
  int fireType;

  ParticleSystem(int num, PVector v, ArrayList<PImage> f) {
    particles = new ArrayList<Particle>();              // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    fire = f;

    // choose 0 for round fire, 1 or 2 for different fires
    fireType = 1;

    for (int i = 0; i < num; i++) {

      // get an origin point for a new particle, somewhere around the ps's origin point
      PVector o = gaussianOrigin();

      particles.add(new Particle(o, fire.get(fireType)));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  // Method to add a force vector to all particles currently in the system
  void applyForce(PVector dir) {
    for (Particle p : particles) {
      p.applyForce(dir);
    }
  }  

  void addParticle() {

    // get an origin point for a new particle, somewhere around the ps's origin point
    PVector o = gaussianOrigin();
    particles.add(new Particle(o, fire.get(fireType)));
  }

  // set a spawn origin point roughly around the original origin
  PVector gaussianOrigin() {
    float x = origin.x;
    float y = origin.y;

    float newX = randomGaussian() * 20 + origin.x;
    float newY = randomGaussian() * 3 + origin.y;

    PVector p = new PVector(newX, newY);
    return p;
  }
}