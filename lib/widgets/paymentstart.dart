import 'package:flutter/material.dart';

class Paymentstart extends StatefulWidget {
  const Paymentstart({super.key});

  @override
  State<Paymentstart> createState() => _PaymentstartState();
}

class _PaymentstartState extends State<Paymentstart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.payment),
            SizedBox(
              width: 10,
            ),
            Text(
              "Payment",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "Choose service",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
          ))
        ],
      ),
    );
  }
}
