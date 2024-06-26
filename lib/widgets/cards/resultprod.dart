import 'package:flutter/material.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:provider/provider.dart';

import '../../models/productmod.dart';

class Resultprod extends StatefulWidget {
  final Product product;
  const Resultprod({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<Resultprod> createState() => _ResultprodState();
}

class _ResultprodState extends State<Resultprod> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      width: 140,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: IconButton(
                      onPressed: () {
                        final shop = context.read<Cartmodel>();
                        shop.addtocart(widget.product);
                      },
                      icon: Icon(
                        Icons.favorite_outline,
                      ))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  fit: BoxFit.cover,
                  widget.product.imageUrl,
                  height: 60,
                  width: 70,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.productName,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\u{20B9} ${widget.product.price}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          final shop = context.read<Cartmodel>();

                          shop.addtofav(widget.product);
                        },
                        icon: Icon(Icons.shopping_bag)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
