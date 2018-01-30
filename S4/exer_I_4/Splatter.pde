class Splatter {
  Drop[] drops; // an array of paint drops
  int sd; // a standard deviation for drop location
  int m; // our mean point for drop location

  Splatter() {
    m = width/2;
    sd = 60;

    drops = new Drop[300]; // make an array to hold 300 drop objects
    
    // now fill that array with drop objects
    for (int i = 0; i < drops.length; i++) {
      drops[i] = new Drop(sd, m);
    }
  }

 // activate() gets all drops in our array to have new locs + colours, and then to display 
  void activate() {
    for (int i = 0; i < drops.length; i++) {
      drops[i].regenerate();
      drops[i].display();
    }
  }
}