import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  const MyCard({
    required this.imagePath,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: size.height * 0.21,
        width: size.width <= 600 ? size.width * 0.45 : size.width * 0.3,
        child: Card(
          elevation: 6,
          shadowColor: const Color.fromRGBO(31, 79, 143, 1.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: size.height * 0.1,
                width: size.width * 0.2,
              ),
              const SizedBox(height: 8.0),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(31, 79, 143, 1.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
