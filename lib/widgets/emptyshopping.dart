import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Emptyshopping extends StatefulWidget {
  String what = "";
  Emptyshopping({required this.what, super.key});

  @override
  State<Emptyshopping> createState() => _EmptyshoppingState();
}

class _EmptyshoppingState extends State<Emptyshopping> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/emptycart.png"),
        SizedBox(
          height: 20,
        ),
        Text(
          'Looks like your ${widget.what} is empty',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Text(
          "Try adding items from the homepage",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        )
      ],
    ));
  }
}
