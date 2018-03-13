/* Rilla's solution for exercise 4.6 in Daniel Shiffman's The Nature of Code.
 
 Exercise 4.6
 Create a simulation of an object shattering into many pieces. 
 How can you turn one large shape into many small particles? 
 What if there are several large shapes on the screen and they 
 shatter when you click on them? */

import java.util.Iterator;

ArrayList<ParticleSystem> systems;
Image i0;
Image i1;
Image i2;

Image[] images;

void setup() {
  size(800, 600);

  // initialise our arraylist of particle systems
  systems = new ArrayList<ParticleSystem>();

  // load up some images
  i0 = new Image("troll0.jpg");
  i1 = new Image("troll1.jpg");
  i2 = new Image("troll2.jpg");

  // put them into our image array
  images = new Image[3];
  images[0] = i0;
  images[1] = i1;
  images[2] = i2;
}

void draw() {
  background(255);

  // call "show()" on all images (show() method checks that image isn't already shattered)
  for (Image i : images) {
    i.show();

    // if the image has been clicked on and is still intact
    if (mousePressed && i.clickedOn() && !i.shattered) {
      // call shatter on it, and add the particle system that gets returned to our systems arraylist
      systems.add(i.shatter());
    }
  }

  Iterator<ParticleSystem> it = systems.iterator();

  // now check that everything in our particle system is still "alive"
  while (it.hasNext()) {
    ParticleSystem ps = it.next();
    if (ps.dead()) {
      // if it's dead, remove it
      it.remove();
    } else {
      // else, run it (and render it)
      ps.run();
    }
  }

  println(systems.size());
}