import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/provider/idprovider.dart';
import 'package:fruit/widgets/mainhomepage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Orderconfirm extends StatefulWidget {
  const Orderconfirm({super.key});

  @override
  State<Orderconfirm> createState() => _OrderconfirmState();
}

class _OrderconfirmState extends State<Orderconfirm> {
  Future<bool> confirmOrder(String orderId) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.9:4000/api/v1/confirmOrder'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'id': orderId}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('Error confirming order: $error');
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    confirmOrder(Provider.of<OrderProvider>(context, listen: false).orderId);
  }

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
              "Order Id:${Provider.of<OrderProvider>(context, listen: false).orderId}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Custombutton(
                text: "Back to Home Screen",
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mainhome(),
                      ));
                },
                color: const Color.fromARGB(255, 130, 205, 71),
                textcolor: Colors.white)
          ],
        ),
      ),
    );
  }
}
