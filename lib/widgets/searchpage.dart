import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:fruit/models/productmod.dart';
import 'package:fruit/widgets/buildprodlist.dart';
import 'package:fruit/widgets/cards/favprodcard.dart';
import 'package:fruit/widgets/cards/productcard.dart';
import 'package:fruit/widgets/detailproduct.dart';
import 'package:fruit/widgets/featureprod.dart';
import 'package:fruit/widgets/searchresult.dart';
import 'package:provider/provider.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  List<Product> productList = [];
  List<Product> found = [];

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
    found = productList;
  }

  void runfil(String key) {
    List<Product> result = [];
    if (key.isEmpty) {
      result = productList;
    } else {
      result = productList
          .where(
              (pr) => pr.productName.toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      found = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController key = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    height: 50,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color.fromARGB(255, 211, 211, 211)),
                    ),
                    child: TextField(
                      controller: key,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        //fillColor: Theme.of(context).colorScheme.secondary,
                        filled: true,
                        hintText: "Try typing apple",
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color.fromARGB(
                      255,
                      61,
                      89,
                      32,
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      runfil(key.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Searchresult(productList: found),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
