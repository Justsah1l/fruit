import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit/widgets/splashscreen/splashtwo.dart';

class Splashone extends StatelessWidget {
  const Splashone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Splashtwo(),
                ));
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 40,
          )),
      backgroundColor: Color.fromARGB(255, 224, 231, 162),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 46,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Image.asset("assets/splashlogo.png"),
          ),
          SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42.0),
            child: Text(
              "wholesale",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color.fromARGB(255, 61, 89, 32)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42.0),
            child: Text(
              "of exotic products",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color.fromARGB(255, 61, 89, 32)),
            ),
          ),
          Spacer(),
          Stack(children: [
            Image.asset("assets/Ellipsecurve.png"),
            Image.asset(
              "assets/splashone.png",
              height: 260,
            ),
          ]),
        ],
      ),
    );
  }
}
