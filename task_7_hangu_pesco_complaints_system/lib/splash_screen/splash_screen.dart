import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/authentication/sign_in/sign_in.dart';
import 'package:hangu_pesco_complaints_system/core/colors/colors.dart';
import 'dart:async';

import 'package:hangu_pesco_complaints_system/core/paths/images_paths.dart';

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
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Signin()));
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
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: Center(
          child: ClipRRect(
            child: Image.asset(
              logo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
