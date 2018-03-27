/* Rilla's solution for exercise 9.1 in Daniel Shiffman's Nature of Code

Exercise 9.1
Create a sketch that generates random strings. We’ll need to know how to do this in order 
to implement the genetic algorithm example that will shortly follow. How long does it take 
for Processing to randomly generate the string “cat”? */

boolean found = false;

void setup() {
}

void draw() {
  if (!found) {
    // pull three random lower case chars
    int random1 = int(random(97, 123));
    int random2 = int(random(97, 123));
    int random3 = int(random(97, 123));

    // make them into a String
    char cword[] = {char(random1), char(random2), char(random3)};
    String word = new String(cword);

    println(word);

    if (word.equals("cat")) {
      println("FOUND");
      found = true;
    }
  }
}