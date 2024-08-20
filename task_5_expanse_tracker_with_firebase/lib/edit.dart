// import 'package:flutter/material.dart';
// import 'package:myapp/custom_textfield.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Future editDetails(String id) => showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Icon(Icons.cancel)),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     const Text(
//                       'Edit Form',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 10),
//                   child: Text(
//                     'Item Name',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 CustomTextfield(
//                     hinttext: 'Item Name', controller: itemnameController),
//                 const SizedBox(height: 10),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 10),
//                   child: Text(
//                     'Amount',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 CustomTextfield(
//                     hinttext: 'Amount', controller: amountController),
//                 const SizedBox(height: 10),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 10),
//                   child: Text(
//                     'Expanse/Income',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 CustomTextfield(
//                     hinttext: 'Expense/Income', controller: statusController),
//                 const SizedBox(height: 10),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       Map<String, dynamic> updateDetails = {
//                         "Item Name": itemnameController.text,
//                         "Amount": amountController.text,
//                         "Status": statusController.text,
//                         "Id": id,
//                       };
//                       await DatabaseMethods()
//                           .updateDetails(id, updateDetails)
//                           .then((value) {
//                         Navigator.pop(context);
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blueAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     child: const Text('Update'),
//                   ),
//                 ),
//               ],
//             ),
//           ));
//   }
// }