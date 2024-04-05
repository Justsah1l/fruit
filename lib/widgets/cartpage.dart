import 'package:flutter/material.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:fruit/widgets/emptyshopping.dart';
import 'package:provider/provider.dart';

class Cartpager extends StatelessWidget {
  const Cartpager({super.key});

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Cartmodel>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: shop.isempty()
            ? Emptyshopping()
            : Consumer<Cartmodel>(
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
              ));
  }
}
