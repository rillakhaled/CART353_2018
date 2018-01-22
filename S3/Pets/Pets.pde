Pet[] pets;

void setup() {
  pets = new Pet[20];

  for (int i = 0; i < pets.length; i++) {

    // fill my pets array randomly with Cats and Dogs

    int p = int(random(2));

    if (p == 0) {
      pets[i] = new Dog(int(random(15)));
    } else {

      pets[i] = new Cat(int(random(15)));
    }
  }

  for (int i = 0; i < pets.length; i++) {   

    print("PET["+i+"] says ");
    pets[i].greeting();

    // note that instanceof can help us know about the object's type
    if (pets[i] instanceof Cat) {
      println("It's a cat. What did I expect?");
    }
  }
}

void draw() {
}