import 'package:flutter/material.dart';

class PendingComplaints extends StatelessWidget {
  const PendingComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Pending Complaints",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
        ),
        body: const Center(
          child: Text('Pending complaints will show here'),
        ),
      ),
    );
  }
}
