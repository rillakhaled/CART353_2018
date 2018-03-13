// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Using Generics now!  comment and annotate, etc.

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float xoff;
  float yoff;

  ParticleSystem(PVector position) {
    origin = position.get();

    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);

    topspeed = 6;

    particles = new ArrayList<Particle>();
  }
  
  void setOrigin(PVector o) {
    origin = o.get();
  }

  void setVelocity(PVector v) {
    velocity = v.get();
  }
  
  void addParticle() {
    origin.add(velocity);
    particles.add(new Particle(origin));
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