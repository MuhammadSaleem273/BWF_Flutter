import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/core/images_path/images_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/custom_card/custom_card_component.dart';
import '../authentication/signup_screen/phone_auth.dart';
import '../user_profile/profile_image.dart';
import 'all_home_screens/about_us_screen.dart';
import 'all_home_screens/complaints_types.dart';
import 'all_home_screens/contact_us_screen.dart';
import 'all_home_screens/my_complaints.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String? userID;
  String? phoneNumber;
  String? fcmToken;
  String? userName;
  File? profileImage;

  /// Get User Data ... >>>>
  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userID = prefs.getString('userId');
      phoneNumber = prefs.getString('phoneNumber');
      fcmToken = prefs.getString('fcmToken');
      userName = prefs.getString('userName');
      String? imagePath = prefs.getString('userImage');
      if (imagePath != null) {
        profileImage = File(imagePath);
      }
    });
  }

  /// Sign-out Method ... >>>>
  void _signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    prefs.remove('phoneNumber');
    prefs.remove('userImage');

    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PhoneAuthScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    print("User fcmToker in Home Screen is >>>> $fcmToken");
    print("User ID in Home Screen is >>>> $userID");
    print("User Name is >>>> $userName");
    print("User Phone Number is >>>> $phoneNumber");
    var mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "User Home",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => _signOut(context),
            ),
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfile(),
                  ),
                );
              },
              icon: const Icon(Icons.person_outline_outlined,
                  size: 40, color: Colors.white)),
        ),
        body: Column(
          children: [
            SizedBox(
              // height: 250,
              height: mediaquery.height * .31,

              child: Stack(children: [

                // 1st container
                Container(
                  // height: 80,
                  height: mediaquery.height * .1,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(31, 79, 143, 1.0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 15,
                  right: 15,
                  child: Container(
                    // height: 200,
                    height: mediaquery.height * 0.25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Card(
                        elevation: 6,
                        child: Image.asset(
                          logo,
                        )),
                  ),
                )
              ]),
            ),
            const Text(
              "Hangu PESCO Complaints System",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(31, 79, 143, 1.0),
              ),
            ),
// ist row it consists of two custom cards/buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //ist component
                MyCard(
                  imagePath: postComplaints,
                  text: "Post Complaints",
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComplaintsTypes(
                          userID: userID.toString(),fcmToken: fcmToken.toString(),
                        ),
                      ),
                    );
                  },
                ),

                // 2nd component for My Complaints
                MyCard(
                  imagePath: myComplaints,
                  text: "My Complaints ",
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyComplaints(),
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: mediaquery.height * .03),

            // 2nd row is started here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //3rd component for About us
                MyCard(
                  imagePath: aboutUs,
                  text: "About Us",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUS(),
                      ),
                    );
                  },
                ),

                // 4th component for Contact us
                MyCard(
                  imagePath: aboutUs,
                  text: "Contact US ",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContactUs(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse('tel:+923341965302');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text('Call'),
            ),
          ],
        ),
      ),
    );
  }

}
