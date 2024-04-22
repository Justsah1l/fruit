// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class AdminScreen extends StatefulWidget {
//   const AdminScreen({super.key});

//   @override
//   State<AdminScreen> createState() => _AdminScreenState();
// }

// class _AdminScreenState extends State<AdminScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text('WelCome Admin'),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool isSilentNotification = false;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Future<void> fetchOrders() async {
  //   await displayNotification('New Order', 'A new order has been placed!');
  // }
  Future<void> fetchOrders() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.1.55:4000/api/v1/getallorders'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success'] == true) {
          final List<dynamic> orders = responseData['data'];
          print(orders);
        } else {
          print('Failed to fetch orders: ${responseData['message']}');
        }
      } else {
        print('Failed to fetch orders: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching orders: $error');
    }
  }

  void toggleSilentNotification() {
    setState(() {
      isSilentNotification = !isSilentNotification;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Welcome Admin',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(
              isSilentNotification
                  ? Icons.notifications_off
                  : Icons.notifications,
            ),
            onPressed: toggleSilentNotification,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Admin Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 329,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 205, 217, 113),
              ),
              child: Column(
                children: [
                  Text('Want to Update the prices'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Update prices'),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchOrders,
              child: Text('Fetch All Orders'),
            ),
          ],
        ),
      ),
    );
  }
}
