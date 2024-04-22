import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/components/customtextfield.dart';
import 'package:fruit/models/productmod.dart';
import 'package:fruit/widgets/carousel.dart';
import 'dart:convert'; // Add import statement for dart:convert

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fruit/widgets/cartpage.dart';
import 'package:fruit/widgets/catagor.dart';
import 'package:fruit/widgets/featureprod.dart';
import 'package:fruit/widgets/login.dart';
import 'package:fruit/widgets/mainaccount.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key})
      : super(key: key); // Corrected syntax for super constructor

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Product> productList = [];

  Future<void> getdata() async {
    // Corrected return type for getdata method
    try {
      var res =
          await Dio().get("http://192.168.1.9:4000/api/v1/getallproducts");
      if (res.statusCode == 200) {
        print(res.data);
        List<dynamic> productsData =
            res.data['data']; // Accessing 'data' property from API response
        setState(() {
          productList = productsData
              .map((productJson) => Product.fromJson(productJson))
              .toList();
        });
        print(productList[0].imageUrl);
      } else {
        print("Failed to load data: ${res.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 40,
                width: 260,
                decoration: BoxDecoration(
                    color: Color.fromARGB(110, 205, 217, 113),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Search ...",
                        style:
                            TextStyle(color: Color.fromARGB(200, 61, 89, 32)),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Icon(Icons.search),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      shape: BoxShape.rectangle,
                      color: const Color.fromARGB(
                        255,
                        61,
                        89,
                        32,
                      )),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list,
                        color: Color.fromARGB(255, 205, 217, 113),
                      )))
            ]),
            // BuildCarouselSlider(),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 150,
                    width: 329,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 110,
                        width: 329,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color.fromARGB(230, 255, 238, 223),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 12),
                              child: Text(
                                "Want pineapple ?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: const Color.fromARGB(
                                        210, 201, 113, 35)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(255, 61, 89, 32),
                                ),
                                child: Center(
                                    child: Text(
                                  "Shop now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: 140,
                    width: 299,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/pineapple.png",
                          height: 119,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            BuildCategories(),
            BuildFeaturedProducts(productList: productList),
          ],
        ),
      ),
    );
  }
}
