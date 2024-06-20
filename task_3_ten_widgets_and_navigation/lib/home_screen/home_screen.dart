
import 'package:flutter/material.dart';
import 'package:task_3_ten_widgets_and_navigation/display_screen/component/custom_textfield.dart';
import 'package:task_3_ten_widgets_and_navigation/display_screen/display_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController dobcontroller = TextEditingController();

  String selectedGender = 'Male';
  double selectedAge = 18;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextfield(
                  hinttext: 'User Name',
                  controller: usernamecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                CustomTextfield(
                  hinttext: 'Email',
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                CustomTextfield(
                  hinttext: 'Phone Number',
                  controller: phonecontroller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                CustomTextfield(
                  hinttext: 'Date of Birth',
                  controller: dobcontroller,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      dobcontroller.text =
                          "${pickedDate.toLocal()}".split(' ')[0];
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your date of birth';
                    }
                    return null;
                  },
                ),
                CustomTextfield(
                  hinttext: 'Gender',
                  controller: TextEditingController(),
                  isGenderSelection: true,
                  selectedGender: selectedGender,
                  onGenderChanged: (String? value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                  validator: (value) {
                    if (selectedGender.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                CustomTextfield(
                  hinttext: 'Age',
                  controller: TextEditingController(),
                  isAgeSlider: true,
                  age: selectedAge,
                  onAgeChanged: (double value) {
                    setState(() {
                      selectedAge = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayScreen(
                                username: usernamecontroller.text,
                                email: emailcontroller.text,
                                phone: phonecontroller.text,
                                dob: dobcontroller.text,
                                gender: selectedGender,
                                age: selectedAge.round().toString(),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
