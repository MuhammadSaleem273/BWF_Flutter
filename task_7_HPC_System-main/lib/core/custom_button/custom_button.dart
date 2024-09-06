import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback voidCallback;
  final String text;

  const CustomButton({
    Key? key,
    required this.voidCallback,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: voidCallback,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
          elevation: 3,
          shadowColor: const Color.fromRGBO(31, 79, 143, 1.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
