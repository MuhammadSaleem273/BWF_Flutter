import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/components/uihelper.dart';
import 'package:hangu_pesco_complaints_system/user_screens/forget_passward/forget_passward.dart';
import 'package:hangu_pesco_complaints_system/user_screens/signup_screen/signup.dart';
import 'package:hangu_pesco_complaints_system/user_screens/user_home/user_home.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            "Login",
                        style: Theme.of(context).textTheme.titleLarge,

          ),
          backgroundColor: const Color.fromRGBO(31, 79, 143, 1.0),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Wellcome Back',style: TextStyle(fontSize:28 ,fontWeight:FontWeight.bold,color: Color.fromRGBO(31, 79, 143, 1.0)),),
                 const SizedBox(
                  height: 30,
                ),
                UiHelper.customTextField(
                    emailcontroller, "email", Icons.mail, false),
                UiHelper.customTextField(
                    passwordcontroller, "passward", Icons.password, true),
                
                // forget passward button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      //MediaQuery.of(context).size.width*0.51,
                      const Expanded(child: SizedBox()),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgetPasward(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forget Passward ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(31, 79, 143, 1.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                // Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: SizedBox(child:   UiHelper.customButton(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserHome(),
                      ),
                    );
                  }, "login"),),
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "if you are new ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(31, 79, 143, 1.0)),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(31, 79, 143, 1.0)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
