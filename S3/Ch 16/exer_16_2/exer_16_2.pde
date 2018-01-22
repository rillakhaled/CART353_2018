// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Rilla's response to exercise 16.2 for CART 353

import processing.video.*;

Movie movie;

void setup() {
  size(320, 240);
  movie = new Movie(this, "cat.mov");
  movie.loop();
}

void movieEvent(Movie movie) {
  movie.read();
}

void draw() {

  // value of mouseX over width determines playback speed, ranging from 0.1 to 5
  // also: not all video formats support backward playback - doesn't work for the cat.mov
  float playBackSpeed = map(mouseX, 0, width, 0.1, 5);

  // The jump() function allows you to jump immediately to a point of time within the video. 
  // duration() returns the total length of the movie in seconds.  
  movie.speed(playBackSpeed); 

  // Display frame
  image(movie, 0, 0);
}