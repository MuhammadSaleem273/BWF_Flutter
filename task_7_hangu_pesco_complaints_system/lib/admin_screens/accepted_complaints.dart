import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/core/color/color.dart';

// ignore: must_be_immutable
class AcceptedComplaints extends StatelessWidget {
   AcceptedComplaints({super.key});
TextEditingController namecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Accepted Complaints",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor:primaryColor ,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
        ),
        body:  const Column(
          children:  [
            Center(
              child: Text('Accepted complaints will show here'),
            ),
          ],
        ),
      ),
    );
  }
}
