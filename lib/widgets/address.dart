import 'package:flutter/material.dart';
import 'package:fruit/components/customtextfield.dart';

class Addresspage extends StatefulWidget {
  const Addresspage({super.key});

  @override
  State<Addresspage> createState() => _AddresspageState();
}

class _AddresspageState extends State<Addresspage> {
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Enter your area or apartment name",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        child: Column(
          children: [
            TextField(
              controller: address,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                //fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
                hintText: "Try typing Pune",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.lightGreen,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Use my current location",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.lightGreen),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset("assets/logo.png")
          ],
        ),
      ),
    );
  }
}
