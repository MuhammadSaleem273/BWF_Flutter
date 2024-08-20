import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home.dart';
import 'package:myapp/login_screen.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  checkUser() {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return const HomeScreen();
  } else {
    return const LoginScreen(); // Or any other screen you want to return when the user is null
  }
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}