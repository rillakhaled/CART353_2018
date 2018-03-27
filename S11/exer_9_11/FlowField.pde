// Shiffman's flowfield code from example 6.4 in Nature of Code

class FlowField {

  // A flow field is a two-dimensional array of PVectors.
  PVector[][] field;
  int cols, rows;
  int resolution;

  // DNA is stored here
  DNA dna;

  // To count which force we're on in the genes
  int geneCounter = 0;

  FlowField(int r, DNA d) {
    resolution = r;
    // Determine the number of columns and rows.
    cols = width/resolution;
    rows = height/resolution;

    dna = d;

    field = new PVector[cols][rows];
  }

  void update() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        // retrieve the appropriate row from DNA  
        field[i][j] = dna.genes[geneCounter].copy();

        geneCounter++;
      }
    }
  }

  // A function to return a PVector based on a location
  PVector lookup(PVector l) {
    int column = int(constrain(l.x/resolution, 0, cols-1));
    int row = int(constrain(l.y/resolution, 0, rows-1));
    return field[column][row].copy();
  }

  DNA getDNA() {
    return dna;
  }
}