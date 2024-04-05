import 'package:flutter/material.dart';
import 'package:fruit/homepage.dart';
import 'package:fruit/widgets/cartpage.dart';
import 'package:fruit/widgets/favpage.dart';
import 'package:fruit/widgets/mainaccount.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
  final List<Widget> _pages = [
    Homepage(),
    Favpage(),
    Cartpager(),
    MyAccountPage()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        tabs: [
          GButton(
            icon: Icons.home,
          ),
          GButton(
            icon: Icons.favorite,
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
