import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/components/customtextfield.dart';
import 'package:fruit/services/otpservice.dart';
import 'package:lottie/lottie.dart';

class Signup extends StatefulWidget {
  String phonenum;
  Signup({required this.phonenum, super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                  child: Image.asset(
                "assets/logo.png",
                height: 160,
              )),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300]),
                  width: 339,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Lets get to ",
                              style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "know each",
                              style: TextStyle(
                                  fontSize: 29, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "other",
                              style: TextStyle(
                                  fontSize: 29, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " better!",
                              style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Customtextfield(
                  controller: name, obsure: false, hinttext: "Enter your name"),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Customtextfield(
                  controller: email,
                  obsure: false,
                  hinttext: "Enter your email"),
              SizedBox(
                height: 20,
              ),
              Custombutton(
                  text: 'Signup',
                  onTap: () {
                    OtpService()
                        .signup(name.text, widget.phonenum, email.text, "user");
                  },
                  color: Colors.lightGreen,
                  textcolor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
