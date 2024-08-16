import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hangu_pesco_complaints_system/user_screens/signup_screen/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to HomeScreen after 5 seconds
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignUp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "HPCS",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(5.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              border: Border.all(
                width: 3,
                color: const Color.fromRGBO(31, 79, 143, 1.0),
              ),
            ),
            child: ClipRRect(
              child: Image.asset(
                "asset/logo.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
