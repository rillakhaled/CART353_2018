// Based heavily on Shiffman's particle systems code

import ddf.minim.*;

ParticleSystem ps;
Attractor attractor;
Minim minim;


void setup() {
  size(640, 480);

  minim = new Minim(this);
  
  ps = new ParticleSystem(minim);
  attractor = new Attractor(new PVector(width/2, 0), 200, minim);
}

void draw() {
  background(10);
  attractor.go();

  if (ps.particles.size() < 30) {
    ps.addParticle();
  }

  ps.applyAttractor(attractor);
  ps.run();
}

void mouseClicked() {
  attractor.clicked(mouseX, mouseY);
}

void mouseReleased() {
  attractor.stopDragging();
}