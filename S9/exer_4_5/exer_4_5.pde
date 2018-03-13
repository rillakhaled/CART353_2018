/* Rilla's solution for exercise 4.5 in Daniel Shiffman's The Nature of Code,
 based heavily on Shiffman's example 4.4 code.
 
 Exercise 4.5
 Rewrite Example 4.4 so that each particle system doesn’t live forever. 
 When a particle system is empty (i.e. has no particles left in its ArrayList), 
 remove it from the ArrayList systems. */

// Particles are generated each cycle through draw(),
// fall with gravity and fade out over time
// A ParticleSystem object manages a variable size (ArrayList) 
// list of particles.


import java.util.Iterator;

ArrayList<ParticleSystem> systems;

void setup() {
  size(640, 360);
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);

  // Initialise an iterator to keep track of our systems
  Iterator<ParticleSystem> it = systems.iterator();

  // the equivalent of looping through an array
  while (it.hasNext()) {
    ParticleSystem ps = it.next();

    // check if the particle system is dead using ParticleSystem's "dead" method
    if (ps.dead()) {
      // get the iterator to remove
      it.remove();
    } else {
      // otherwise, run it 
      ps.run();
    }
    // how many systems are currently in our systems array
    println(systems.size());
  }
  

  fill(0);
  text("click mouse to add particle systems", 10, height-30);
}

void mousePressed() {
  // add a new particle system everytime the mouse is pressed, using the mouse pos as origin point
  systems.add(new ParticleSystem(100, new PVector(mouseX, mouseY)));
}