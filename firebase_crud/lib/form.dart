// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:myapp/custom_textfield.dart';
// import 'package:myapp/service/database.dart';
// import 'package:random_string/random_string.dart';

// class MyForm extends StatefulWidget {
//   const MyForm({super.key});

//   @override
//   State<MyForm> createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
//   final TextEditingController itemnameController = new TextEditingController();
//   final TextEditingController amountController =new TextEditingController();
//   final TextEditingController statusController =new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Track your Expanse',
//           style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         // leading: IconButton(
//         //   icon: const Icon(Icons.arrow_back,color: Colors.blue,),
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         // ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(left: 10),
//               child: Text(
//                 'Item Name',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             CustomTextfield(
//                 hinttext: 'Item Name', controller: itemnameController),
//             const SizedBox(
//               height: 10,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 10),
//               child: Text(
//                 'Amount',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             CustomTextfield(hinttext: 'Amounot', controller: amountController),
//             const SizedBox(
//               height: 10,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 10),
//               child: Text(
//                 'Expanse/Income',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             CustomTextfield(
//                 hinttext: 'Expense/Income', controller: statusController),
//             const SizedBox(
//               height: 10,
//             ),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   String Id = randomAlphaNumeric(10);
//                   Map<String, dynamic> detailsinfoMap = {
//                     "Item Name": itemnameController.text,
//                     "Amount": amountController.text,
//                     "Status": statusController.text,
//                     "Id": Id, 
//                   };
//                   await DatabaseMethods()
//                       .addDetails(detailsinfoMap , Id)
//                       .then((value) {
//                     Fluttertoast.showToast(
                      
//                         msg: "Details added Successfully",
//                         toastLength: Toast.LENGTH_SHORT,
//                         gravity: ToastGravity.CENTER,
//                         timeInSecForIosWeb: 1,
//                         backgroundColor: Colors.green,
//                         textColor: Colors.white,
//                         fontSize: 16.0);
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(

//                     // shape: RoundedRectangleBorder(

//                     //   borderRadius: BorderRadius.circular(20.0),
//                     // ),
//                     ),
//                 child: const Text('Add'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/custom_textfield.dart';
import 'package:myapp/service/database.dart';
import 'package:random_string/random_string.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController itemnameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track your Expanse',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Item Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            CustomTextfield(
                hinttext: 'Item Name', controller: itemnameController),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Amount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            CustomTextfield(hinttext: 'Amount', controller: amountController),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Expanse/Income',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            CustomTextfield(
                hinttext: 'Expense/Income', controller: statusController),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  String id = randomAlphaNumeric(10);
                  Map<String, dynamic> detailsinfoMap = {
                    "Item Name": itemnameController.text,
                    "Amount": amountController.text,
                    "Status": statusController.text,
                    "Id": id,
                  };
                  try {
                    await DatabaseMethods().addDetails(detailsinfoMap, id);
                    Fluttertoast.showToast(
                      msg: "Details added Successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } catch (e) {
                    Fluttertoast.showToast(
                      msg: "Failed to add details: $e",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
