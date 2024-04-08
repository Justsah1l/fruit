import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit/components/custombutton.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:fruit/models/productmod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  static const route = '/detail';
  final Product product;
  const ProductDetailsPage({super.key, required this.product});
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1; // Default quantity

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Cartmodel>();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Product details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Icon(Icons.favorite_border),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              widget.product.imageUrl,
              height: 260,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.product.productName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 29),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border_outlined),
                    )
                  ],
                ),
                Text(
                  "1kg, Price",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                quantity--;
                              });
                            },
                            icon: Icon(Icons.remove)),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.lightGreen)),
                          child: Text(quantity.toString()),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.lightGreen,
                            )),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '\u{20B9} ${widget.product.price * quantity}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: const Color.fromARGB(255, 210, 209, 209),
                ),
                Text(
                  "Product Detail",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                  widget.product.desc,
                  style: TextStyle(
                      fontSize: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 195, 192, 192)),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: const Color.fromARGB(255, 210, 209, 209),
                ),
                Row(
                  children: [
                    Text(
                      "Nutritions",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
                Divider(
                  color: const Color.fromARGB(255, 210, 209, 209),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Review",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    Spacer(),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    shop.addtocart(widget.product);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 48, 110, 50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: Text(
                      "Add To Basket",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
/*Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Product details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 205, 217, 113)),
                child: Icon(Icons.arrow_back))),
        actions: [
          Icon(Icons.favorite_border),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20),
            child: Text(
              widget.product.productName,
              style: TextStyle(
                  color: const Color.fromARGB(255, 61, 89, 32),
                  fontWeight: FontWeight.w600,
                  fontSize: 40),
            ),
          ),
          SizedBox(
            height: 26,
          ),
          Center(
            child: Image.network(
              widget.product.imageUrl,
              height: 260,
            ),
          ),
          Spacer(),
          Container(
            height: 340,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45), topRight: Radius.circular(45)),
              color: Color.fromARGB(255, 221, 239, 91),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 26.0, vertical: 23),
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: const Color.fromARGB(255, 11, 49, 40)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26.0,
                  ),
                  child: Text(
                    "Price",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 11, 49, 40)),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: Text(
                        '\u{20B9} ${widget.product.price.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26.0),
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color.fromARGB(255, 61, 89, 32),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Color.fromARGB(255, 61, 89, 32),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add to cart",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 61, 89, 32)),
                          )
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
 */