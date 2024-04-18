import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit/widgets/Orderhistory.dart';
import 'package:fruit/widgets/cartpage.dart';
import 'package:fruit/widgets/favpage.dart';
import 'package:fruit/widgets/login.dart';
import 'package:fruit/widgets/userinfo.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.lightGreen, width: 2),
                        // This sets the radius to make it a circle
                        color: Colors.white, // Background color of the oval
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://cdn.pixabay.com/photo/2012/04/13/21/07/user-33638_640.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Aditya K',
                      style: GoogleFonts.getFont('Poppins',
                          fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text("aditya@gmail.com"),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 29.0),
                          child: Text(
                            "Settings",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 23),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BuildAccountTile(
                            title: "User Information",
                            icon: Icons.person_outline,
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Usersettings(),
                                  ));
                            }),
                        BuildAccountTile(
                            title: "My Cart",
                            icon: Icons.shopping_cart_outlined,
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Cartpager(),
                                  ));
                            }),
                        BuildAccountTile(
                            title: "My Favorites",
                            icon: Icons.favorite_outline,
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Favpage(),
                                  ));
                            }),
                        BuildAccountTile(
                            title: "Order History",
                            icon: Icons.notifications_outlined,
                            callback: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderHistory(),
                                  ));
                            }),
                        BuildAccountTile(
                            title: "Help",
                            icon: Icons.help_outline,
                            callback: () {}),
                        BuildAccountTile(
                            title: "Refer a Friend",
                            icon: Icons.person_add_outlined,
                            callback: () {}),
                        BuildAccountTile(
                            title: "Logout",
                            icon: Icons.logout_outlined,
                            callback: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Loginpage(onTap: () {}),
                                  ));
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class BuildAccountTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback callback;
  const BuildAccountTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: callback,
        child: ListTile(
          trailing: Icon(Icons.arrow_forward_ios),
          title: Text(
            title,
            style: GoogleFonts.getFont('Poppins',
                fontSize: 20, fontWeight: FontWeight.w400),
          ),
          leading: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
