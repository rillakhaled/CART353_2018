// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    //particles.add(new Particle(origin));

    // we will spawn particles from the mouse to make it easy
    // to check if our repellers are working
    particles.add(new Particle(new PVector(mouseX, mouseY)));
  }

  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void applyRepeller(Repeller r) {
    // for each particle in this system
    for (Particle p : particles) {
      // work out the repel force for this repeller
      PVector force = r.repel(p);        
      // apply that force to the particle
      p.applyForce(force);
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
}