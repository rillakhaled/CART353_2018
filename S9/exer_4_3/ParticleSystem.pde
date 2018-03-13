// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Using Generics now!  comment and annotate, etc.

class ParticleSystem {
  // The <Particle> after ArrayList means we're declaring what type of object we're putting into ArrayList
  ArrayList<Particle> particles;
  //ArrayList particles;
  
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
    xoff = 0.0;
    yoff = 1000;

    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    // setting origin to mouse loc is how we'd get particles to emit from mouse
    // origin = new PVector(mouseX, mouseY);

    // alternatively, the origin can change according to an acceleration and a velocity
    setAcceleration();
    velocity.add(acceleration);
    velocity.limit(topspeed);
    checkEdges();
    origin.add(velocity);

    particles.add(new Particle(origin));
  }

  // obatains a new value for acceleration based on perlin noise
  void setAcceleration() {

    // get a perlin noise val based on xoff for our horiz acceleration, scaled to [-0.01, 0.01]
    acceleration.x = map(noise(xoff), 0, 1, -0.01, 0.01);

    // get a perlin noise val based on yoff for our vert acceleration, scaled to [-0.01, 0.01]
    acceleration.y = map(noise(yoff), 0, 1, -0.01, 0.01);

    // update xoff and yoff
    xoff += 0.01;
    yoff += 0.01;
  }

  // checkEdges() wraps position horizontally and vertically
  void checkEdges() {

    if (origin.x > width) {
      origin.x = 0;
    } else if (origin.x < 0) {
      origin.x = width;
    }

    if (origin.y > height) {
      origin.y = 0;
    } else if (origin.y < 0) {
      origin.y = height;
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      /* If we weren't using generics we'd need to do a cast: 
      Particle p = (Particle)particles.get(i); */
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}