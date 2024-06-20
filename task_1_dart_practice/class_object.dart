class Person {

  String name;
  int age;

  
  Person(this.name, this.age);

  void displayInfo() {
    print('Name: $name, Age: $age');
  }
}

void main() {
  Person person1 = Person('Ali', 25);
  person1.displayInfo(); 

  Person person2 = Person('Saleem', 20);
  person2.displayInfo(); 
}
