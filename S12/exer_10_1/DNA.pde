// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// DNA is an array of vectors

class DNA {

  // The genetic sequence
  float[] genes;

  // Constructor (makes a DNA of random floats as weights)
  DNA() {
    genes = new float[3];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = random(-1, 1);
    }
  }
  
  // our fitness function takes in the correct answer - a
  void fitness(float a) {
    
    // we compare our answer to a
    // given that we know the diff can be -2, 0, or 2, let's square it
    
  }

  // Constructor #2, creates the instance based on an existing array
  DNA(float[] newgenes) {
    // We could make a copy if necessary
    // genes = (PVector []) newgenes.clone();
    genes = newgenes;
  }

  // CROSSOVER
  // Creates new DNA sequence from two (this & and a partner)
  DNA crossover(DNA partner) {
    float[] child = new float[genes.length];
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

  // Based on a mutation probability, picks a new random float
  void mutate(float m) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
        genes[i] = random(-1, 1);
      }
    }
  }
}