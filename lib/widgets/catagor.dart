import 'package:flutter/material.dart';
import 'package:fruit/widgets/catlistpage.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCategories extends StatefulWidget {
  const BuildCategories({super.key});

  @override
  State<BuildCategories> createState() => _BuildCategoriesState();
}

class _BuildCategoriesState extends State<BuildCategories> {
  List<String> fruitCategories = [
    'All',
    'Banana',
    'lavocat',
    'mango',
    'ananas',
    'Dried',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Text(
                    'Categories',
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            /* Container(
              height: 70,
              child: ListView.builder(
                itemCount: fruitCategories.length,
                itemBuilder: (context, index) {
                  // Define lists for icons and colors
                  List<IconData> icons = [
                    Icons.food_bank, // Fresh Fruits
                    Icons.eco, // Organic Fruits
                    Icons.wb_sunny, // Seasonal Fruits
                    Icons.wb_sunny, // Dried Fruits
                    Icons.card_giftcard, // Gift Baskets
                    Icons.shopping_cart, // Bulk Purchases
                    // Add more icons as needed
                  ];

                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 90,
                        height: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(7),
                            color: Color.fromARGB(223, 233, 238, 200)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              icons[index], // Use icon based on index
                              color: Colors.green[800],
                              size: 18,
                            ),
                            Text(fruitCategories[index])
                          ],
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
