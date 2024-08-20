import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/admin_screens/accepted_complaints.dart';
import 'package:hangu_pesco_complaints_system/admin_screens/pending_compliants.dart';
import 'package:hangu_pesco_complaints_system/admin_screens/emergency_complaints.dart';
import 'package:hangu_pesco_complaints_system/core/colors/colors.dart';
import 'package:hangu_pesco_complaints_system/core/paths/images_paths.dart';
import 'package:hangu_pesco_complaints_system/widgets/custom_card/custom_card_component.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

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
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // height: 250,
              height: mediaquery.height * .31,

              child: Stack(children: [
                // 1st container
                Container(
                  // height: 100,
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
                  // 1st container
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

            //1st row that consists of 2 custom cards/buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyCard(
                  imagePath: pendingComplaints,
                  text: "Pending\nComplaints",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PendingComplaints(),
                      ),
                    );
                  },
                ),

                // 2nd component for My Complaints
                MyCard(
                  imagePath: acceptedComplaints,
                  text: "Accepted\nComplaints",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  AcceptedComplaints(),
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: mediaquery.height * .02),

            // 2nd row is started here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //3rd component for About us
                MyCard(
                  imagePath: emergencyComplaints,
                  text: "Emergency\nComplaints",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmergencyComplaints(),
                      ),
                    );
                  },
                ),
                 MyCard(
                  imagePath: acceptedComplaints,
                  text: "Meter\nRequest",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  AcceptedComplaints(),
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
