// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class ParticleSystem {
  ArrayList<Particle> particles;

  // Uses fire fly image by Jim Sullivan from the Noun Project
  PImage ff;

  ParticleSystem(Minim m) {
    particles = new ArrayList<Particle>();
    ff = loadImage("firefly.png");
  }

  void addParticle() {
    particles.add(new Particle(new PVector(random(width), random(height)), ff));
  }

  // A function to apply a force to all Particles
  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void applyAttractor(Attractor a) {
    for (Particle p : particles) {
      PVector force = a.attract(p);        
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