import 'package:flutter/material.dart';
import 'package:fruit/widgets/buildprodlist.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/productmod.dart';

class BuildFeaturedProducts extends StatelessWidget {
  const BuildFeaturedProducts({
    super.key,
    required this.productList,
  });

  final List<Product> productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 19),
              //Header
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      color: const Color.fromARGB(255, 171, 171, 171),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            //Fruits Header
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8),
              child: Text(
                'Fruits',
                style: GoogleFonts.getFont(
                  'Poppins',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            BuildListProducts(productList: productList),
            //Veges Header
          ],
        ),
      ),
    );
  }
}
