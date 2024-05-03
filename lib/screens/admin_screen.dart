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
  List<Map<String, dynamic>> orders = [];
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

  Future<void> fetchOrders() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.1.37:4000/api/v1/getallorders'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success'] == true) {
          print(responseData['data']);
          setState(() {
            orders = List<Map<String, dynamic>>.from(responseData['data']);
          });
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
      backgroundColor: Color(0xFF0A192F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Welcome Admin',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
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
                  color: Colors.black87,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFF172a46),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Want to Update the prices',
                      style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        overlayColor: MaterialStateProperty.all(
                            Colors.transparent), // Background color
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // Text color
                        elevation: MaterialStateProperty.all<double>(8),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16), // Border radius
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Update prices'),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xFF172a46),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Check The Orders',
                      style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        overlayColor: MaterialStateProperty.all(
                            Colors.transparent), // Background color
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // Text color
                        elevation: MaterialStateProperty.all<double>(8),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(16), // Border radius
                          ),
                        ),
                      ),
                      onPressed: fetchOrders,
                      child: Text('Fetch All Orders'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0), // Adjust the spacing as needed
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFF172a46),
                      ),
                      child: ListTile(
                        title: Text(order['phoneNumber'] ?? 'Unknown'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Product ID: ${order['productId'] ?? 'Unknown'}'),
                            Text('Quantity: ${order['quantity'] ?? 'Unknown'}'),
                            Text('Address: ${order['address'] ?? 'Unknown'}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
