class Pet {
  protected int friendly;
  protected int clean;
  protected int age;
  protected int hunger;

  Pet(int a) {
    age = a;
    hunger = 0;
  }

  void eat() {
    // eating code (a very very poor model of how eating relates to hunger)
    hunger = 0;
  }

  // one versions of playedOutside that takes no parameters
  void playedOutside() {
    hunger++;
  }

  // another version of playedOutside that takes one parameter
  // i.e. we have overloaded "playedOutside"
  void playedOutside(int hungerLevel) {
    hunger = hungerLevel;
  }

  void greeting() {
    // do nothing
  }
  void greeting(int treat) {
    println("I love treats");
  }
}