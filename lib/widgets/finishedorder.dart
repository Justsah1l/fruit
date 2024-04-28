import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fruit/models/productmod.dart';
import 'package:fruit/widgets/cards/finishcard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Finishedorder extends StatefulWidget {
  const Finishedorder({super.key});

  @override
  State<Finishedorder> createState() => _FinishedorderState();
}

class _FinishedorderState extends State<Finishedorder> {
  List<Product> productList = [];

  Future<Map<String, dynamic>> getOrdersByPhoneNumber(
      String phoneNumber) async {
    final String apiUrl =
        "http://192.168.1.9:4000/api/v1/getOrderByPhoneNumber";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'phoneNumber': phoneNumber,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      throw Exception('Failed to load orders: $e');
    }
  }

  Future<void> getdata() async {
    // Corrected return type for getdata method
    try {
      var res = await Dio()
          .get("http://192.168.1.9:4000/api/v1/getOrderByPhoneNumber");
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
    //getdata();
    getOrdersByPhoneNumber("1234567890");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 12),
          child: GestureDetector(onTap: () {}, child: Finishcard()),
        );
      },
    ));
  }
}
