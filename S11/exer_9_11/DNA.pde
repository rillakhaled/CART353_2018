// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Pathfinding w/ Genetic Algorithms

// DNA is an array of vectors

class DNA {

  // The genetic sequence
  PVector[] genes;

  int cols;
  int rows;

  // The maximum strength of the forces - let's go with 1
  float maxforce = 1;

  // Constructor (makes a DNA of random PVectors, where the PVectors describe forcefields)
  DNA() {
    
    cols = width/20;
    rows = height/20;
    
    // note: our genes array is LONG! 
    // for every lifetime step, we need to have a distinct forcefield - a 2D array
    // i.e. we need an array of size lifetime * forcefield dimensions
    genes = new PVector[lifetime * cols * rows];
    init();
  }

  void init() {
    
    int geneC = 0;
    // even though we're modeling a 2D array, for making the rest of the code in DNA work
    // we will flatten it into a 1D array
    for (int l = 0; l < lifetime; l++) {
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
          // put a random 2D vector in here
          genes[geneC] = PVector.random2D();
          geneC++;
        }
      }
    }
  }

  // Constructor #2, creates the instance based on an existing array
  DNA(PVector[] newgenes) {
    // We could make a copy if necessary
    // genes = (PVector []) newgenes.clone();
    genes = newgenes;
  }

  // CROSSOVER
  // Creates new DNA sequence from two (this & and a partner)
  DNA crossover(DNA partner) {
    PVector[] child = new PVector[genes.length];
    // Pick a midpoint
    int crossover = int(random(genes.length));
    // Take "half" from one and "half" from the other
    for (int i = 0; i < genes.length; i++) {
      if (i > crossover) child[i] = genes[i];
      else               child[i] = partner.genes[i];
    }    
    DNA newgenes = new DNA(child);
    return newgenes;
  }

  // Based on a mutation probability, picks a new random Vector
  void mutate(float m) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
        float angle = random(TWO_PI);
        genes[i] = new PVector(cos(angle), sin(angle));
        if (i == 0) genes[i].normalize();
      }
    }
  }
}