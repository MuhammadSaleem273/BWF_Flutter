import 'package:flutter/material.dart';
import 'package:myapp/custom_textfield.dart';

class EditForm extends StatefulWidget {
   const EditForm({super.key});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final TextEditingController itemnameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController statusController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CustomTextfield(hinttext: 'Item Name', controller:itemnameController),
          const SizedBox(height: 10,),
          CustomTextfield(hinttext: 'Amounot', controller:amountController),
          const SizedBox(height: 10,),

          CustomTextfield(hinttext: 'Expense/Income', controller:statusController),
          const SizedBox(height: 10,),
ElevatedButton(
  
  onPressed: (){},
  style: ElevatedButton.styleFrom(
    
    // shape: RoundedRectangleBorder(
      
    //   borderRadius: BorderRadius.circular(20.0),
    // ),
  ), child: const Text('Add'),
  )
  
        ],),
      ),
    );
  }
}
