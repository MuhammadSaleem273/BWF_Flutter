Future<String> fetchUserData() {
  return Future.delayed(Duration(seconds: 3), () 
  {
    return 'Muhammad Saleem'; 
  }
  );
}

void main() async {
  print('Fetching user data...');
  String userData = await fetchUserData();
  print('User data: $userData');
  print('Task completed!');
}
