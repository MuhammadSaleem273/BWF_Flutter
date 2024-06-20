import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        centerTitle: true,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Center(
              child: Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  child: Text(
                    ' Muhammad Saleem ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ))),

        ],
      ),
    );
  }
}
