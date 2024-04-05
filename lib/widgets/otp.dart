import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/provider/phoneprov.dart';
import 'package:fruit/services/otpservice.dart';
import 'package:fruit/widgets/mainhomepage.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class Otpscreen extends StatefulWidget {
  final String phonenum;
  const Otpscreen({required this.phonenum, super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  String phoneNumber = "";
  @override
  void initState() {
    phoneNumber = widget.phonenum;
    // TODO: implement initState
    super.initState();
  }

  TextEditingController _otpController = TextEditingController();
  final defaultPinTheme = PinTheme(
    width: 50,
    height: 55,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      //color: Colors.grey,
      color: Colors.grey,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/logo.png"),
                    Row(
                      children: [
                        Text(
                          "Verification",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        Text(
                          " Code",
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter the verification code that has been sent on your phone number",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Pinput(
                      length: 6,
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                    /*Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 58,
                          width: 44,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor:
                                    Theme.of(context).colorScheme.secondary,
                                filled: true,
                                focusColor:
                                    const Color.fromARGB(255, 53, 53, 53)),
                            style: Theme.of(context).textTheme.headlineLarge,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 58,
                          width: 44,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor:
                                    Theme.of(context).colorScheme.secondary,
                                filled: true,
                                focusColor:
                                    const Color.fromARGB(255, 53, 53, 53)),
                            style: Theme.of(context).textTheme.headlineLarge,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 58,
                          width: 44,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor:
                                    Theme.of(context).colorScheme.secondary,
                                filled: true,
                                focusColor:
                                    const Color.fromARGB(255, 53, 53, 53)),
                            style: Theme.of(context).textTheme.headlineLarge,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 58,
                          width: 44,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor:
                                    Theme.of(context).colorScheme.secondary,
                                filled: true,
                                focusColor:
                                    const Color.fromARGB(255, 53, 53, 53)),
                            style: Theme.of(context).textTheme.headlineLarge,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 58,
                          width: 44,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor:
                                    Theme.of(context).colorScheme.secondary,
                                filled: true,
                                focusColor:
                                    const Color.fromARGB(255, 53, 53, 53)),
                            style: Theme.of(context).textTheme.headlineLarge,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 58,
                          width: 44,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor:
                                    Theme.of(context).colorScheme.secondary,
                                filled: true,
                                focusColor:
                                    const Color.fromARGB(255, 53, 53, 53)),
                            style: Theme.of(context).textTheme.headlineLarge,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ), */
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          width: 170,
                          child: Custombutton(
                              textcolor: Colors.black,
                              text: "Resend",
                              color: Colors.grey[300],
                              onTap: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Container(
                          height: 70,
                          width: 170,
                          child: Custombutton(
                              textcolor: Colors.black,
                              text: "Confirm",
                              color: Colors.lightGreen,
                              onTap: () async {
                                String enteredOtp = _otpController.text;
                                print('$_otpController');
                                try {
                                  int isOtpValid = await OtpService()
                                      .verifyOtp(phoneNumber, enteredOtp);

                                  if (isOtpValid == 0) {
                                    print(
                                        'Number passed to Home Screen: ${phoneNumber}');

                                    //   onUserLogin();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Mainhome(),
                                        ));
                                  } else if (isOtpValid == 1) {
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Invalid OTP'),
                                          content:
                                              Text('Please enter a valid OTP.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                } catch (e) {
                                  // Handle any exception that might occur during OTP verification
                                  print('Error: $e');
                                }
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
