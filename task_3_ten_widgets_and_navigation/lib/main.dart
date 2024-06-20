
import 'package:flutter/material.dart';
import 'package:task_3_ten_widgets_and_navigation/home_screen/home_screen.dart';



void main()  {
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BWF_Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.amber,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(color: Colors.amber)),
      home: const HomeScreen(),
    );
  }
}
