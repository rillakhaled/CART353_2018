size(255, 255);

loadPixels();

for (int x = 0; x < width; x++) {
  for (int y = 0; y < height; y++) {
    int loc = x + y*width;
    float distance = dist(width/2, height/2, x, y);
    pixels[loc] = color((int)distance);
  }
}
updatePixels();