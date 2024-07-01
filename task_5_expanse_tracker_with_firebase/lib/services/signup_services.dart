// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:app/my_screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

signupservices(String firstname,String lastname,String useremail,String userpassword) async {
  User? currentuser = FirebaseAuth.instance.currentUser;
  try {

await FirebaseFirestore.instance.collection('Users').doc(currentuser!.uid).set({
       'firstname': firstname,
       'lastname': lastname,
       'useremail':useremail,
       'userpassword': userpassword,
       'createdAt':DateTime.now(),
       'userID': currentuser.uid,
      


}).then((value)=>{
     
     FirebaseAuth.instance.signOut(),
      Get.to(()=>LoginScreen())

});

     
    
  } catch (e) {
    print('Error : $e');
  }

}