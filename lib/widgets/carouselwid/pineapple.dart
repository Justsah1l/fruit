import 'package:flutter/material.dart';

class Pineapple extends StatelessWidget {
  const Pineapple({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 150,
            width: 329,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 110,
                width: 329,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color.fromARGB(230, 255, 238, 223),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 12),
                      child: Text(
                        "Want pineapple ?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: const Color.fromARGB(210, 201, 113, 35)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(255, 61, 89, 32),
                        ),
                        child: Center(
                            child: Text(
                          "Shop now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            height: 140,
            width: 299,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/pineapple.png",
                  height: 119,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
