import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/core/colors/colors.dart';
import 'package:hangu_pesco_complaints_system/user_screens/user_home/all_home_screens/complaints_types.dart';

void main() async {
  runApp(const MyApp());

  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  // await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //this style is for all complints screns lables just at upper at the teh textfield
        textTheme: TextTheme(
          labelMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),

          // this is for App Bar
          titleLarge: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      home: ComplaintsTypes(),
    );
  }
}
