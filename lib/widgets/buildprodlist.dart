import 'package:flutter/material.dart';
import 'package:fruit/models/productmod.dart';
import 'package:fruit/widgets/cards/productcard.dart';
import 'package:fruit/widgets/detailproduct.dart';

class BuildListProducts extends StatelessWidget {
  const BuildListProducts({
    super.key,
    required this.productList,
  });

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsPage(product: productList[index]),
                  ));
            },
            child: ProductCard(
              product: productList[index],
            ),
          ),
        ),
      ),
    );
  }
}
