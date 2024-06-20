import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String username;
  final String email;
  final String phone;
  final String dob;
  final String gender;
  final String age;

  const DisplayScreen({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
    required this.dob,
    required this.gender,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username: $username'),
                const Divider(),
                Text('Email: $email'),
                const Divider(),
                Text('Phone: $phone'),
                const Divider(),
                Text('Date of Birth: $dob'),
                const Divider(),
                Text('Gender: $gender'),
                const Divider(),
                Text('Age: $age'),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
