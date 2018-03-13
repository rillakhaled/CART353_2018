// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles

  ParticleSystem() {
    particles = new ArrayList<Particle>();   // Initialize the arraylist
  }

  // Notice how we're iterating through the array backwards, to get around the 
  // issue of skipping over an element in the case that we have to do a removal
  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle(PVector o, PImage i) {
    particles.add(new Particle(o, i));
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }
}