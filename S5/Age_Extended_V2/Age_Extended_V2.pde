AgeHolder ah;

void setup() {
  ah = new AgeHolder(99);
}

void draw() {
  println("age before changeAge: "+ah.age);
  changeAge(ah);
  println("age after changeAge: "+ah.age);
}

void changeAge(AgeHolder a) {
  
  a.age += 1;
  println("age inside changeAge first time: "+a.age);
  
  a = new AgeHolder(200);
  a.age += 1;
  println("age inside changeAge second time: "+a.age);
}

class AgeHolder {
  int age;
  
  AgeHolder(int a) {
   age = a; 
  }
}