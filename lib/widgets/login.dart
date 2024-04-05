import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/provider/phoneprov.dart';
import 'package:fruit/services/otpservice.dart';
import 'package:fruit/widgets/otp.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key, required this.onTap});
  void Function()? onTap;

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String? _phoneNumber;
  Country coun = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void ontap() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //////
              Image.asset("assets/logo.png"),

              SizedBox(
                height: 30,
              ),
              Text(
                "Welcome Back !",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: IntlPhoneField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Your Phone Number",

                    filled: true,
                    fillColor: Colors.white, // Background color
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Reduced border radius
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16), // Reduced height
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    _phoneNumber = phone.completeNumber;
                  },
                ),
              ),
              SizedBox(
                height: 23,
              ),

              Custombutton(
                color: Colors.lightGreen,
                textcolor: Colors.white,
                onTap: () async {
                  print("Sent");
                  try {
                    bool send = await OtpService().sendOtp(_phoneNumber!);
                    if (send) {
                      print('succes');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Otpscreen(
                              phonenum: _phoneNumber!,
                            ),
                          ));
                    }
                  } catch (e) {
                    print('Error: $e');
                  }
                  if (_formKey.currentState!.validate()) {
                    String phoneNumber = _phoneNumber!;

                    Provider.of<NumberProvider>(context, listen: false)
                        .phoneNumber = phoneNumber;
                  }
                },
                text: "Send OTP",
              ),
              // Text.rich(
              //   TextSpan(
              //       text: "Not a member ?",
              //       children: [TextSpan(text: "Resgister now")]),
              // )
              SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a Member ?  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Admin",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
