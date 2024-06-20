void main() {
  // Integer data type
  int age = 20;
  print('Age: $age');

  // Double data type
  double height = 5.9;
  print('Height: $height');

  // Boolean data type
  bool isStudent = true;
  print('Is student: $isStudent');

  // String data type
  String name = 'Muhammad Saleem';
  print('Name: $name');

  // List data type
  List<String> hobbies = ['Reading', 'Traveling', 'Swimming'];
  print('Hobbies: $hobbies');

  // Map data type
  Map<String, String> address = {
    'city': 'Hangu',
    'state': 'KPK'
  };
  print('Address: $address');

  // Set data type
  Set<int> uniqueNumbers = {1, 2, 3, 4, 5};
  print('Unique Numbers: $uniqueNumbers');

  // Null safety with nullable type
  String? nullableString;
  print('Nullable String: $nullableString');
  
  // Assigning a value to the nullable variable
  nullableString = 'Now I have a value';
  print('Nullable String after assignment: $nullableString');
}
