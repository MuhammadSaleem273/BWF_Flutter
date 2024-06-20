abstract class Animal {
  void makeSound();
  
  // Concrete method
  void sleep() {
    print('Animal is sleeping');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Dog barks');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Cat meows');
  }
}

void main() {
  Dog dog = Dog();
  Cat cat = Cat();

  dog.makeSound(); 
  cat.makeSound(); 

  dog.sleep(); 
  cat.sleep(); 
}
