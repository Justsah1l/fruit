import 'package:flutter/material.dart';
import 'package:fruit/models/cartmodel.dart';
import 'package:fruit/themes/themeprov.dart';
import 'package:fruit/widgets/address.dart';
import 'package:fruit/widgets/mainhomepage.dart';
import 'package:fruit/widgets/orderconfirm.dart';
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
