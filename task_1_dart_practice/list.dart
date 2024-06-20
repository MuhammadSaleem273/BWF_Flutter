void main() {
  
  List<int> numbers = [1, 2, 3, 4, 5];

  
  numbers.add(6);
  numbers.addAll([7, 8, 9]);

  
  numbers.remove(1); 
  numbers.removeAt(0); 
  numbers.removeLast(); 

  
  int firstElement = numbers[0];
  int lastElement = numbers[numbers.length - 1];

  print('First element: $firstElement');
  print('Last element: $lastElement');

  
  print('All elements in the list:');
  for (int number in numbers) {
    print(number);
  }
}