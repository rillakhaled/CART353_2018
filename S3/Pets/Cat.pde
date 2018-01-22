class Cat extends Pet {

  Cat(int a) {
    super(a);
    super.friendly = 3;
    super.clean = 10;
  }

  void greeting() {
    println("...");
  }
}