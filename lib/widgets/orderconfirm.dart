import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';

class Orderconfirm extends StatelessWidget {
  const Orderconfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/ordercon.png"),
            SizedBox(
              height: 40,
            ),
            Text(
              "Order Confirmed",
              style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "You order has been confirmed.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
              " Will be delivered soon",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Order Id:10000090",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Custombutton(
                text: "Track Your Order",
                onTap: () {},
                color: const Color.fromARGB(255, 130, 205, 71),
                textcolor: Colors.white)
          ],
        ),
      ),
    );
  }
}
