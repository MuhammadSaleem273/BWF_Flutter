// ignore_for_file: unused_import, unused_local_variable, depend_on_referenced_packages

import 'dart:developer';


import 'package:app/my_screens/login_screen.dart';
import 'package:app/services/signup_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  
  get emailValidator => null;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
     
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 40),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Track Your budget flow',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 15),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            SizedBox(
                              width: size.width*0.46,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                             vertical: 10),
                                child: TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'This field cannot be empty';
                                    }
                                    return null;
                                  },
                                  controller: firstnameController,
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                    prefixIcon: const Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.blue)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.grey)),
                                  ),
                                ),
                              ),
                            ),
                         SizedBox(
                              width: size.width*0.44,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.symmetric( horizontal: 2,
                             vertical: 10),
                                child: TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'This field cannot be empty';
                                    }
                                    return null;
                                  },
                                  controller: lastnameController,
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    prefixIcon: const Icon(Icons.person),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.blue)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(color: Colors.grey)),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: TextFormField(
                        validator: emailValidate,
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.amber)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.amber)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      child: TextFormField(
                        obscureText: passwordVisible,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field cannot be empty';
                          }
                          return null;
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.amber)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.amber)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async{
                          if (_formKey.currentState!.validate()) {
                           var firstname = firstnameController.text.trim();
                           var lastname = lastnameController.text.trim();
                           var email = emailController.text.trim();
                           var password = passwordController.text.trim();
                            await FirebaseAuth.instance.createUserWithEmailAndPassword
                            (email: email,
                             password: password).then((value)=>{
                              signupservices(firstname, lastname, email, password),
                              Get.snackbar('Registered', 'successfully registered '),
                              log('User created'),
                             });
                          }
                        },
                        child: const Text('Signup'),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.22,
                    ),
                    
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already Have an Account?',
                            style: TextStyle(fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                            },
                            child: const Text(
                              'Log In Now',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? emailValidate(String? value) {
    if (value!.isEmpty) {
      return 'This field cannot be empty';
    } else if (!emailValidator.validate(value)) {
      return 'Email format is invalid';
    }
    return null;
  }
}