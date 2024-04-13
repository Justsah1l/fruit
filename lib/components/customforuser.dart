import 'package:flutter/material.dart';

class Customtextuser extends StatelessWidget {
  String hinttext;
  Widget? prefixIcon;
  TextEditingController controller;
  Customtextuser(
      {required this.controller,
      required this.prefixIcon,
      required this.hinttext,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 22),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          //fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hinttext,
        ),
      ),
    );
  }
}
