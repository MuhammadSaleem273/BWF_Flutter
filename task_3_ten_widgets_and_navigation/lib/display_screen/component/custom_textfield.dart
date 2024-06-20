import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool isGenderSelection;
  final String? selectedGender;
  final ValueChanged<String?>? onGenderChanged;
  final bool isAgeSlider;
  final double? age;
  final ValueChanged<double>? onAgeChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextfield({
    super.key,
    required this.hinttext,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    this.isGenderSelection = false,
    this.selectedGender,
    this.onGenderChanged,
    this.isAgeSlider = false,
    this.age,
    this.onAgeChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    if (isGenderSelection) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hinttext,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: selectedGender,
                    onChanged: onGenderChanged,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: selectedGender,
                    onChanged: onGenderChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else if (isAgeSlider) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hinttext,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: age ?? 18,
              min: 0,
              max: 100,
              divisions: 100,
              label: age?.round().toString(),
              onChanged: onAgeChanged,
            ),
            Text(
              'Age: ${age?.round().toString()}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator,
          decoration: InputDecoration(
            hintText: hinttext,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }
  }
}
