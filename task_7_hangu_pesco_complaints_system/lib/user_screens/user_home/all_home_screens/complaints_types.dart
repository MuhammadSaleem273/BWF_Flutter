import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/core/colors/colors.dart';
import 'package:hangu_pesco_complaints_system/user_screens/complaint_screens/other_complaints.dart';
import 'package:hangu_pesco_complaints_system/widgets/custom_button/custom_buton.dart';
import 'package:hangu_pesco_complaints_system/user_screens/complaint_screens/bill_complaints.dart';
import 'package:hangu_pesco_complaints_system/user_screens/complaint_screens/theft_complaints.dart';

class ComplaintsTypes extends StatelessWidget {
  const ComplaintsTypes({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "HPCS",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: primaryColor,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1 text for  Bottun  bill complaints

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Post Bill Complaint",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:primaryColor),
                    ),
                    const Expanded(child: SizedBox()),
                    const Text(
                      "بلوں سے متعلق شکایت",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(31, 79, 143, 1.0)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: 10,
                height: mediaquery.height * .01,
              ),
              //1  button stats here
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  child: CustomButton(onPressed: (){
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BillComplaint(),
                      ),
                    );
                  }, text: 'Bill Complaint')
                ),
              ),

              SizedBox(
                // height: 30,
                height: mediaquery.height * .04,
              ),

              // 2 Button"Post theft complaint",

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Post theft complaint",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "بجلی چوری کی شکایت",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: 10,
                height: mediaquery.height * .01,
              ),
              // 2   button starts for theft complaints
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    child: CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TheftComplaint(),
                            ),
                          );
                        },
                        text: 'Theft Reporting')),
              ),

              SizedBox(
                // height: 30,
                height: mediaquery.height * .04,
              ),

              //  text writting for other complaints button 3
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Post other complaints",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "    دوسری شکایتیں",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                // height: 10,
                height: mediaquery.height * .01,
              ),

              // 3 buttons starts for Other Complaints
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                    child: CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OtherComplaints(),
                            ),
                          );
                        },
                        text: 'Other Complaints')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
