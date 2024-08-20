import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/core/color/color.dart';
import 'package:hangu_pesco_complaints_system/core/color/paths/images_paths.dart';

import 'package:hangu_pesco_complaints_system/widgets/custom_card/custom_card_component.dart';
import 'package:hangu_pesco_complaints_system/user_screens/user_home/all_home_screens/about_us_screen.dart';
import 'package:hangu_pesco_complaints_system/user_screens/user_home/all_home_screens/complaints_types.dart';
import 'package:hangu_pesco_complaints_system/user_screens/user_home/all_home_screens/contact_us_screen.dart';
import 'package:hangu_pesco_complaints_system/user_screens/user_home/all_home_screens/my_complaints.dart';
import 'package:hangu_pesco_complaints_system/user_screens/complainant_profile/profile_image.dart';


class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: primaryColor,
          centerTitle: true,
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
                  decoration:  BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(
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
             Text(
              "Hangu PESCO Complaints System",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: primaryColor,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComplaintsTypes(),
                      ),
                    );
                  },
                ),

                // 2nd component for My Complaints
                MyCard(
                  imagePath: myComplaints,
                  text: "My Complaints ",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyComplaints(),
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
                  imagePath: contactUs,
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
          ],
        ),
      ),
    );
  }
}
