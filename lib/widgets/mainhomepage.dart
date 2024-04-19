import 'package:flutter/material.dart';
import 'package:fruit/homepage.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:fruit/provider/idprovider.dart';
import 'package:fruit/widgets/Orderhistory.dart';
import 'package:fruit/widgets/cartpage.dart';
import 'package:fruit/widgets/favpage.dart';
import 'package:fruit/widgets/mainaccount.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  final List<String> names = [
    "Homepage",
    "Favorites",
    "History",
    "Cart",
    "Account",
  ];
  final List<Widget> _pages = [
    Homepage(),
    Favpage(),
    OrderHistory(),
    Cartpager(),
    MyAccountPage()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          names[index] == "Homepage"
              ? "Hello ${Provider.of<OrderProvider>(context, listen: false).name}"
              : names[index],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          badges.Badge(
            badgeStyle: badges.BadgeStyle(
                badgeColor: Color.fromARGB(255, 247, 100, 89)),
            position: badges.BadgePosition.topEnd(),
            badgeContent: Consumer<Cartmodel>(
              builder: (context, value, child) {
                return Text(
                  value.cartitems.length.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                );
              },
            ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 205, 217, 113)),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cartpager(),
                      ));
                },
                icon: Icon(Icons.trolley),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 205, 217, 113)),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyAccountPage(),
                    ));
              },
              icon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
        //centerTitle: true,
      ),
      bottomNavigationBar: GNav(
        tabs: [
          GButton(
            icon: Icons.home,
          ),
          GButton(
            icon: Icons.favorite,
          ),
          GButton(
            icon: Icons.history_sharp,
          ),
          GButton(
            icon: Icons.shopping_bag,
          ),
          GButton(
            icon: Icons.person,
          ),
        ],
        padding: EdgeInsets.all(26),
        tabBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        curve: Curves.easeInCirc,
        backgroundColor: Colors.white,
        color: Colors.black,
        gap: 8,
        activeColor: Colors.lightGreen,
        onTabChange: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: _pages[index],
    );
  }
}
