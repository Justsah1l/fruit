import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit/widgets/cards/finishcard.dart';

class Activeorder extends StatefulWidget {
  const Activeorder({super.key});

  @override
  State<Activeorder> createState() => _ActiveorderState();
}

class _ActiveorderState extends State<Activeorder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Finishcard(),
        SizedBox(
          height: 17,
        ),
        Container(
          height: 54,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10,
              ),
              Text("The Food is on the way !"),
              Spacer(),
              Icon(
                Icons.directions_car,
                color: Color.fromARGB(255, 100, 145, 52),
              ),
              Text(
                " 10 min",
                style: TextStyle(color: Color.fromARGB(255, 100, 145, 52)),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        )
      ],
    );
  }
}
