import 'package:flutter/material.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:fruit/widgets/cards/favprodcard.dart';
import 'package:badges/badges.dart' as badges;

import 'package:fruit/widgets/cartpage.dart';
import 'package:fruit/widgets/detailproduct.dart';
import 'package:fruit/widgets/emptyshopping.dart';
import 'package:fruit/widgets/mainaccount.dart';
import 'package:provider/provider.dart';

class Favpage extends StatefulWidget {
  const Favpage({super.key});

  @override
  State<Favpage> createState() => _FavpageState();
}

class _FavpageState extends State<Favpage> {
  @override
  Widget build(BuildContext context) {
    final shop = context.read<Cartmodel>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: shop.favcartitems.isEmpty
          ? Emptyshopping(
              what: "favorite item cart",
            )
          : Consumer<Cartmodel>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Your Favourite Products !",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 61, 89, 32),
                          ),
                        ),
                      ),
                      Expanded(
                          child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 230,
                          crossAxisCount: 2,
                        ),
                        itemCount: value.favcartitems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailsPage(
                                          product: value.favcartitems[index]),
                                    ));
                              },
                              child: Favprodcard(
                                product: value.favcartitems[index],
                              ),
                            ),
                          );
                        },
                      ))
                    ],
                  ),
                );
              },
            ),
    );
  }
}
