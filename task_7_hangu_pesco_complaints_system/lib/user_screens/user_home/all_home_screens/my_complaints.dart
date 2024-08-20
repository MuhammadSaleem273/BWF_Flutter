// ignore_for_file: empty_statements, dead_code

import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/core/colors/colors.dart';

class MyComplaints extends StatelessWidget {
  const MyComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Complaints",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: primaryColor,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
        ),
        body: const Center(
          child: Text('Your complaints will dispaly here'),
        ),
      ),
    );
    ;
  }
}
