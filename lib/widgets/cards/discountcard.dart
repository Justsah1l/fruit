import 'package:flutter/material.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:provider/provider.dart';

import '../../models/productmod.dart';

class DiscountCard extends StatefulWidget {
  final Product product;
  const DiscountCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  bool _isFavorite = false;
  @override
  void initState() {
    // TODO: implement initState
    final shop = context.read<Cartmodel>();
    print(shop.favcartitems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Padding(
                  padding: const EdgeInsets.only(right: 3.0),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isFavorite = true;
                        });
                        final shop = context.read<Cartmodel>();

                        shop.addtofav(widget.product);
                      },
                      icon: _isFavorite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(Icons.favorite_border_outlined))),
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
                      icon: Icon(Icons.add))),
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
                  children: [
                    Text(
                      '\u{20B9} ${(widget.product.price - 30).toString()}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '30% OFF',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
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
