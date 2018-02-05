int age;

void setup() {
  age = 99;
}

void draw() {
  println("age before: "+age);
  changeAge(age);
  println("age after: "+age);
}

void changeAge(int a) {
  a++;
  println("a: "+a);
}