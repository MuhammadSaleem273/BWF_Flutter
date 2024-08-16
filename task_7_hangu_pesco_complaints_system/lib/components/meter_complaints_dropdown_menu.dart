import 'package:flutter/material.dart';

class MeterComplaintsMenu extends StatefulWidget {
  const MeterComplaintsMenu({super.key, });

  @override
  // ignore: library_private_types_in_public_api
  _MeterComplaintsMenuState createState() => _MeterComplaintsMenuState();
}

class _MeterComplaintsMenuState extends State<MeterComplaintsMenu> {
  String _selectedName = 'SELECT COMPLAINT TYPE';
  final List<String> _names = [
    'SELECT COMPLAINT TYPE',
    '1. Damaged Meter',
    '2. Meter Sparking/Wire Loose',
    '3. Electric Fire',
    '4. Damage Transformer',
    '5. Fluctuation',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(31, 79, 143, 1.0),
          width: 2, 
        ),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedName,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        items: _names.map((String name) {
          return DropdownMenuItem<String>(
            value: name,
            child: Text("  $name"),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedName = newValue!;
          });
        },
      ),
    );
  }
}
