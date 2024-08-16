import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/components/uihelper.dart';
import 'package:hangu_pesco_complaints_system/components/uihelper.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .35,
                    width: double.infinity,
                    color: const Color.fromRGBO(31, 79, 143, 1.0),
                    child: Image.asset(
                      "asset/logo.png",
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: 200,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .71,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          children: [
                            const Text(
                              'Wellcome Back',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(31, 79, 143, 1.0),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Signing in your account',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(31, 79, 143, 1.0),
                                    ),
                                  )),
                            ),
                            UiHelper.customTextField(
                                namecontroller, "Name", Icons.person, false),
                            UiHelper.customTextField(
                                phonecontroller, "Phone", Icons.phone, false),
                            UiHelper.customButton(() {}, "Send OTP")
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
