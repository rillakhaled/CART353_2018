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

  // An equal probablity of any type of Particle being added
  void addParticle() {
    float r = random(1);
    if (r < 0.25) { 
      particles.add(new Particle(origin));
    } else if (r < 0.5) {
      particles.add(new Confetti(origin));
    } else if (r < 0.75) {
      particles.add(new Rain(origin));
    } else {
      particles.add(new Dart(origin));
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