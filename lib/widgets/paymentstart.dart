import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/components/customtextfield.dart';
import 'package:fruit/widgets/cards/paymentmethod.dart';
import 'package:fruit/widgets/orderconfirm.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Paymentstart extends StatefulWidget {
  const Paymentstart({super.key});

  @override
  State<Paymentstart> createState() => _PaymentstartState();
}

class _PaymentstartState extends State<Paymentstart> {
  final _razorpay = Razorpay();
  @override
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(
        "-------------------------------------------------success-----------------------------------------------------------");
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

  TextEditingController service = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController payment = TextEditingController();
  TextEditingController price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "Choose service",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              )),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Paymentmethod(
                    method: "text",
                    dec: "adadadfawfawfawfawfawfawfafafafawf",
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Paymentmethod(
                    method: "text",
                    dec: "adadadfawfawfawfawfawfawfafafafawf",
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Available payment method",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Paymentmethod(
                    method: "Cash payment on delivery",
                    dec: "You pay when your order is delivered.",
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Paymentmethod(
                    method: "text",
                    dec: "adadadfawfawfawfawfawfawfafafafawf",
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified,
                    color: const Color.fromARGB(255, 11, 49, 49),
                  ),
                  Text(
                    "Verify",
                    style: TextStyle(
                        color: Color.fromARGB(255, 11, 49, 49),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  )
                ],
              ),
              Customtextfield(
                  controller: service, obsure: false, hinttext: "Service"),
              Customtextfield(
                  controller: address, obsure: false, hinttext: "Address"),
              Customtextfield(
                  controller: phone, obsure: false, hinttext: "Phone no"),
              Customtextfield(
                  controller: payment, obsure: false, hinttext: "Payment"),
              Customtextfield(
                  controller: price, obsure: false, hinttext: "Price"),
              Text(
                "Check your information before to confirm.",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 242, 65, 53)),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 126,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color.fromARGB(255, 205, 217, 113),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 12,
                                color:
                                    const Color.fromARGB(255, 172, 172, 172)),
                          ),
                          Text(
                            "\u{20B9} 1000",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      openpay();
                    },
                    child: Container(
                      height: 60,
                      width: 196,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color.fromARGB(255, 61, 89, 32),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.payment,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Pay Now",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
