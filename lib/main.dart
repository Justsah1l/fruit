import 'package:flutter/material.dart';
import 'package:fruit/homepage.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:fruit/themes/themeprov.dart';
import 'package:fruit/widgets/carousel.dart';
import 'package:fruit/widgets/cartpage.dart';
import 'package:fruit/widgets/emptyshopping.dart';
import 'package:fruit/widgets/getstarted.dart';
import 'package:fruit/widgets/login.dart';
import 'package:fruit/widgets/mainaccount.dart';
import 'package:fruit/widgets/mainhomepage.dart';
import 'package:fruit/widgets/otp.dart';
import 'package:fruit/widgets/signup.dart';
import 'package:fruit/widgets/splashscreen/splashone.dart';
import 'package:fruit/widgets/splashscreen/splashtwo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Themeprov(),
      ),
      ChangeNotifierProvider(
        create: (context) => Cartmodel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Provider.of<Themeprov>(context).themedata,
        home: Mainhome());
  }
}
