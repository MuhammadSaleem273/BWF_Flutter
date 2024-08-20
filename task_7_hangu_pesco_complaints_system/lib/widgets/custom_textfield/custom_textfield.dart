import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData icon; 

  const CustomTextfield({
    super.key,
    required this.hinttext,
    required this.controller,
    required this.icon,
    this.validator,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            widget.icon, // Use IconData here to create an Icon
            color: const Color.fromRGBO(31, 79, 143, 1.0),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
