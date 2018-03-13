import ddf.minim.*;

Minim minim;
AudioInput in;
ParticleSystem ps;

void setup() {
  size(640, 360);
  ps = new ParticleSystem();

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}

void draw() {
  background(255);

  // add gravity force to all
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);

  float incoming = 0;

  // I'm summing the incoming sound - since my mic is unidirectional, left and right inputs are the same
  for (int i = 0; i < in.bufferSize() - 1; i++) {
    incoming += Math.abs(in.left.get(i));
  }

  incoming /= in.bufferSize();

  // if the incoming sound is over a certain threshold
  if (incoming >= 0.01) {

    // make a kind of wind vector with a rightwards force
    PVector rightWind = new PVector(incoming * 30, 0);
    ps.applyForce(rightWind);
  }

  for (int i = 0; i < 5; i++) {
    ps.addParticle();
  }
  
  ps.run();
}