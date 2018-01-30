class Cat extends Pet {
  
  // note that we *are* allowed to have something called age in Cat
  // which is distinct from Pet's age
  int age;

  Cat(int a) {
    super(a);
    age = 4;
    super.friendly = 3;
    super.clean = 10;
  }

  void greeting() {
    println("...");
    println(this.age+" "+super.age);
  }
}