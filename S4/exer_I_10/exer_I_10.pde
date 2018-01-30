float zoff;
float cell;
float[][] heights;

void setup() {

  size(600, 400, P3D); 
  zoff = 1000.0;
  cell = 20;

  // this array essentially lets us store (x, y, z) values: i and j will let us determine x and y, while the stored val is z
  heights = new float[20][15];
}

// calculateHeights() is based on i, j, and a changing value of zoff
void calculateHeights() {
  
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 15; j++) {

      // assign z a perlin noise val based on a mapping of i, a mapping of j, and zoff
      float z = noise(map(i, 0, 19, 0, 1), map(j, 0, 14, 0, 1), zoff);

      // in heights[i][j], store a new height: a mapped version of z that will vary between -100 and 100
      heights[i][j] = map(z, 0, 1, -100, 100);
    }
  }

  // change zoff for next time we call draw()
  zoff += 0.01;
}

void draw() {
  background(255);

  // fill our heights array with a new set of z vals
  calculateHeights();

  // change the perspective on our cell grid so we can see the heights better
  pushMatrix();
  translate(100, 100, -50);
  rotateX(PI/4);

  for (int i = 0; i < 19; i++) { // NB i < 19 because we will grab array slots that are i+1, and this index is max 19
    for (int j = 0; j < 14; j++) { //NB j < 14 because we will grab array slots that are j+1, and this index is max 14

      stroke(255);
      fill(100);

      pushMatrix();
      // translate our point of origin for drawing: jump to where each cell starts
      translate(i * cell, j * cell, 0);

      // we have to use quads rather than rect: this will allow us
      // to define 4 vertices in 3D space (i.e. we can work the notion of 
      // variable height in this way)
      beginShape(QUADS);

      // now specify 4 vertices, each a point in 3D space, drawing from our heights array
      vertex(0, 0, heights[i][j]);
      vertex(cell, 0, heights[i+1][j]);
      vertex(cell, cell, heights[i+1][j+1]);
      vertex(0, cell, heights[i][j+1]);
      endShape();

      // popMatrix so that we can reset the origin for our next quad
      popMatrix();
    }
  }
  popMatrix();
}