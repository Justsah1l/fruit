import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/components/customtextfield.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:fruit/services/createorder.dart';
import 'package:fruit/widgets/emptyshopping.dart';
import 'package:fruit/widgets/paymentstart.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import './../provider/idprovider.dart';

class Cartpager extends StatefulWidget {
  const Cartpager({super.key});

  @override
  State<Cartpager> createState() => _CartpagerState();
}

class _CartpagerState extends State<Cartpager> {
  final _razorpay = Razorpay();
  @override
  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print(
        "-------------------------------------------------success-----------------------------------------------------------");
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

  @override
  Widget build(BuildContext context) {
    TextEditingController promo = TextEditingController();
    final shop = context.read<Cartmodel>();
    void p() {
      print(shop.howmany);
    }

    createorder() async {
      OrderService orderService = OrderService();

      // Example order data
      Map<String, dynamic> orderData = {
        'phoneNumber': '1234567890',
        'products': shop.cartitems,
        'totalPrice': 35,
        'status': 'pending',
      };

      // Creating order

      final result = await orderService.createOrder(orderData);
      String id = result['data']['id'];
      print(
          "ID ----------------------------------------------------------------------------  ${id}");
      Provider.of<OrderProvider>(context, listen: false).id(id);
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: shop.isempty()
            ? Emptyshopping(
                what: "cart",
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17.0, vertical: 10),
                    child: Text(
                      '${shop.howmany()} items',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 172, 172, 172),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: shop.cartitems.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17.0, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 183, 231, 127),
                                borderRadius: BorderRadius.circular(12)),
                            height: 110,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 23.0, vertical: 19),
                                  child: Container(
                                    height: 70,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Image.network(
                                          fit: BoxFit.contain,
                                          shop.cartitems[index].imageUrl),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      shop.cartitems[index].productName,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Fruit",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              )),
                                          Text(
                                            "1",
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.remove,
                                                color: Colors.black,
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          shop.removefromcart(
                                              shop.cartitems[index]);
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        )),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 7),
                                      child: Text(
                                        '\u{20B9} ${shop.cartitems[index].price}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17.0,
                    ),
                    child: Text(
                      "Promo code",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17.0,
                    ),
                    child: SizedBox(
                      height: 55,
                      width: 390,
                      child: TextField(
                        controller: promo,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: Icon(Icons.check)),
                          fillColor: const Color.fromARGB(255, 205, 217, 113),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          filled: true,
                          hintText: "Apply a promo code",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17.0,
                    ),
                    child: Text(
                      "* If you have a promo code, copy it here.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: const Color.fromARGB(255, 242, 65, 53)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17.0,
                    ),
                    child: Text(
                      "Order summary",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Subtotal"),
                            Spacer(),
                            Text(
                              '\u{20B9} ${shop.calculatetotal()}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text("Discount"),
                            Spacer(),
                            Text(
                              '\u{20B9} 0',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text("Total"),
                            Spacer(),
                            Text(
                              '\u{20B9} ${shop.calculatetotal()}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Center(
                    child: SizedBox(
                        height: 50,
                        width: 340,
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              createorder();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Paymentstart(),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 61, 89, 32),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                "Checkout",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              )),
                            ),
                          ),
                        )),
                  )
                ],
              ));
  }
}

/*Consumer<Cartmodel>(
                builder: (context, value, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: Row(
                          children: [
                            Icon(Icons.shopping_bag),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Shopping Bag",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Expanded(
                          child: ListView.builder(
                        padding: EdgeInsets.all(12),
                        itemCount: value.cartitems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[200]),
                              child: Center(
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 60,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Image.network(
                                          value.cartitems[index].imageUrl,
                                          //height: 60,
                                          fit: BoxFit.contain,
                                        )),
                                  ),
                                  title: Text(
                                    value.cartitems[index].productName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    '\$ ' +
                                        value.cartitems[index].price.toString(),
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        final shop = context.read<Cartmodel>();
                                        shop.removefromcart(
                                            value.cartitems[index]);
                                      },
                                      icon: Icon(Icons.cancel)),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 126,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$" + '${shop.calculatetotal()}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Pay",
                                      style: TextStyle(
                                          fontSize: 26,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Icon(
                                      Icons.arrow_circle_right_sharp,
                                      color: Colors.white,
                                      size: 40,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  );
                },
              ) */
