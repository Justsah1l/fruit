import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/widgets/login.dart';

class Getstart extends StatelessWidget {
  const Getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/signupscreen.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Grocery Shop",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
            ),
            Text(
              "at your door",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              "The easiest way to buy your",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.grey),
            ),
            Text(
              "grocery shopping",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Custombutton(
                  text: "Get started",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Loginpage(onTap: () {}),
                        ));
                  },
                  color: Colors.lightGreen,
                  textcolor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
