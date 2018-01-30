Pet[] pets;

void setup() {
  pets = new Pet[20];
  
  Dog d = new Dog(5);

  for (int i = 0; i < pets.length; i++) {

    // fill my pets array randomly with Cats and Dogs
    int p = int(random(2));

    if (p == 0) {
      //pets[i] = new Dog(int(random(15)));
      pets[i] = d;
    } else {
      pets[i] = new Cat(int(random(15)));
      
    }
  }

  for (int i = 0; i < pets.length; i++) {   

    print("PET["+i+"] says ");
    
    // the magic of polymorphism means that the most specific 
    // type of greeting will get called
    pets[i].greeting();
    pets[i].playedOutside();
    pets[i].playedOutside(int(random(10)));

    // note that instanceof can help us know about the object's type
    if (pets[i] instanceof Cat) {
      println("It's a cat. What did I expect?");
    }
  }
}

void draw() {
}