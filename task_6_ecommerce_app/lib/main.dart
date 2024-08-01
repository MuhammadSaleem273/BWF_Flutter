
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:task_6_ecommerce_app/Provider/add_to_cart_provider.dart';
import 'package:task_6_ecommerce_app/Provider/favorite_provider.dart';
import 'package:task_6_ecommerce_app/Screens/bottom_navigation.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) => MultiProvider(
//         providers: [
//           // for add to cart 
//           ChangeNotifierProvider(create: (_)=>CartProvider()),
//           // for favorite 
//           ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
//         ],
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData(
            
//           ),
//           home: const BottomNavigation(),
//         ),
//       );
// }
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigation(),
    );
  }
}
