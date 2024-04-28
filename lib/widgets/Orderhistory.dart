import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit/widgets/Activeorder.dart';
import 'package:fruit/widgets/finishedorder.dart';

/*
class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  bool finish = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order History"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          finish = true;
                        });
                      },
                      child: Text(
                        "Finished Order",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: finish
                                ? Color.fromARGB(255, 100, 145, 52)
                                : Colors.grey),
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          finish = false;
                        });
                      },
                      child: Text(
                        "Active Order",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: finish
                                ? Colors.grey
                                : Color.fromARGB(255, 100, 145, 52)),
                      )),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Expanded(child: Finishedorder()),
            ],
          ),
        ));
  }
}
*/
class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  bool finish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      finish = true;
                    });
                  },
                  child: Text(
                    "Finished Order",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: finish
                          ? Color.fromARGB(255, 100, 145, 52)
                          : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      finish = false;
                    });
                  },
                  child: Text(
                    "Active Order",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: finish
                          ? Colors.grey
                          : Color.fromARGB(255, 100, 145, 52),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            finish
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10,
                      ),
                      child: Finishedorder(),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10,
                      ),
                      child: Activeorder(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
