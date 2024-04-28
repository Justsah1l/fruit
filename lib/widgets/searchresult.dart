import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit/models/productmod.dart';
import 'package:fruit/widgets/cards/favprodcard.dart';
import 'package:fruit/widgets/cards/resultprod.dart';
import 'package:fruit/widgets/detailproduct.dart';

class Searchresult extends StatefulWidget {
  List<Product> productList = [];
  Searchresult({required this.productList, super.key});

  @override
  State<Searchresult> createState() => _SearchresultState();
}

class _SearchresultState extends State<Searchresult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Expanded(
            child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 220,
            crossAxisCount: 2,
          ),
          itemCount: widget.productList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                            product: widget.productList[index]),
                      ));
                },
                child: Resultprod(
                  product: widget.productList[index],
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
