import 'dart:async';
import 'dart:math';

import 'package:fruit/models/productmod.dart';
import 'package:fruit/provider/idprovider.dart';
// Add import statement for dart:convert

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fruit/widgets/carousel.dart';

import 'package:fruit/widgets/catagor.dart';
import 'package:fruit/widgets/featurediscount.dart';
import 'package:fruit/widgets/featureprod.dart';
import 'package:fruit/widgets/searchpage.dart';
import './widgets/carouselwid/pineapple.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key})
      : super(key: key); // Corrected syntax for super constructor

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Product> productList = [];
  List<Product> veglist = [];
  List<Product> fruitlist = [];

  Future<void> getdata() async {
    print(
        "-----------------------------------------------------getdata started ---------------------------------------------");
    // Corrected return type for getdata method
    try {
      var res =
          await Dio().get("http://192.168.1.9:4000/api/v1/getallproducts");
      if (res.statusCode == 200) {
        print(res.data['data']);
        List<dynamic> productsData =
            res.data['data']; // Accessing 'data' property from API response
        setState(() {
          productList = productsData
              .map((productJson) => Product.fromJson(productJson))
              .toList();
        });

        print(productList[0].imageUrl);
        assigndata();
      } else {
        print("Failed to load data: ${res.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  assigndata() {
    for (var element in productList) {
      if (element.category == "Fruits") {
        fruitlist.add(element);
      } else {
        veglist.add(element);
      }
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Searchpage(),
                      ));
                },
                child: Container(
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
            BuildCarouselSlider(),
            SizedBox(
              height: 15,
            ),
            BuildDiscount(productList: productList),
            BuildCategories(),
            BuildFeaturedProducts(
              fru: fruitlist,
              veg: veglist,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
