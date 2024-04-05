import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit/widgets/getstarted.dart';

class Splashtwo extends StatelessWidget {
  const Splashtwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Getstart(),
                ));
          },
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 40,
          )),
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Stack(
          children: [
            Image.asset("assets/splashtwo.png"),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 46,
                  ),
                  Image.asset("assets/splashlogo.png"),
                  Text(
                    "All best products",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Color.fromARGB(255, 61, 89, 32)),
                  ),
                  Text(
                    "at one place",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Color.fromARGB(255, 61, 89, 32)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
