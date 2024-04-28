import 'package:flutter/material.dart';

class Finishcard extends StatefulWidget {
  const Finishcard({super.key});

  @override
  State<Finishcard> createState() => _FinishcardState();
}

class _FinishcardState extends State<Finishcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 7,
                blurStyle: BlurStyle.inner)
          ],
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/logo.png",
            fit: BoxFit.cover,
            width: 126,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Banana",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Row(
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Done",
                      style: TextStyle(
                          color: Color.fromARGB(255, 100, 145, 52),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Address",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 155,
                    ),
                    Text(
                      "15.00",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 100, 145, 52)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
