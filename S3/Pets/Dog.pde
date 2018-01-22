class Dog extends Pet {

  Dog(int a) {
    super(a);
    super.friendly = 10;
    super.clean = 2;
  }

  void greeting() {
    println("WOOF WOOF! WOOF WOOF!");
  }
}