import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/components/customtextfield.dart';
import 'package:fruit/provider/idprovider.dart';
import 'package:fruit/widgets/orderconfirm.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Addresspage extends StatefulWidget {
  const Addresspage({super.key});

  @override
  State<Addresspage> createState() => _AddresspageState();
}

class _AddresspageState extends State<Addresspage> {
  final _razorpay = Razorpay();

  Future<Map<String, dynamic>> confirmOrder() async {
    String orderId = Provider.of<OrderProvider>(context, listen: false).orderId;
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.9:4000/api/v1/confirmOrder'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'id': orderId}),
      );

      if (response.statusCode == 200) {
        return {
          'success': true,
          'message': 'Order confirmed successfully!',
        };
      } else {
        return {
          'success': false,
          'message':
              'Failed to confirm order. Server responded with ${response.statusCode}',
        };
      }
    } catch (error) {
      print('Error confirming order: $error');
      return {
        'success': false,
        'message': 'Internal Server Error',
      };
    }
  }

  @override
  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print(
        "-------------------------------------------------success-----------------------------------------------------------");
    print(
        '----------------------------------------------------------${Provider.of<OrderProvider>(context, listen: false).orderId}----------------------------------------------------------');
    await confirmOrder();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Orderconfirm(),
        ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(
        "-------------------------------------------------falied-------------------------------------------------");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print(
        "-------------------------------------------------external wallet-------------------------------------------------");
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openpay() {
    var options = {
      'key': 'rzp_test_61XG6CqADFDGCc',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Enter your area or apartment name",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: address,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                //fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                hintText: "Try typing Pune",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.lightGreen,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Use my current location",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.lightGreen),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset("assets/logo.png"),
            Spacer(),
            Custombutton(
                text: "Pay",
                onTap: () {
                  openpay();
                },
                color: Colors.lightGreen,
                textcolor: Colors.white)
          ],
        ),
      ),
    );
  }
}
