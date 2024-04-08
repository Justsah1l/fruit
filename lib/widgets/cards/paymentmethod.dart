import 'package:flutter/material.dart';

class Paymentmethod extends StatefulWidget {
  String method = "";
  String dec = "";
  Paymentmethod({required this.method, required this.dec, super.key});

  @override
  State<Paymentmethod> createState() => _PaymentmethodState();
}

class _PaymentmethodState extends State<Paymentmethod> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.method,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.dec,
              style: TextStyle(color: const Color.fromARGB(255, 186, 185, 185)),
            ),
            Spacer(),
            Row(
              children: [
                Text('\u{20B9} 00'),
                Spacer(),
                Checkbox(
                  value: ischecked,
                  onChanged: (value) {
                    setState(() {
                      ischecked = !ischecked;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
