import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Emptyshopping extends StatelessWidget {
  const Emptyshopping({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.lightGreen.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/emptycart.json"),
          SizedBox(
            height: 30,
          ),
          Text(
            "Looks like your cart is empty",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Try adding items from Homepage",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ));
  }
}
