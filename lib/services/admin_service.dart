import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> createOrder(Map<String, dynamic> orderData) async {
  final url = Uri.parse('http://192.168.1.55:4000/api/v1/getallorders');
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode(orderData);

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 201) {
      print('Order created successfully');
    } else {
      print('Failed to create order: ${response.statusCode}');
    }
  } catch (error) {
    print('Error creating order: $error');
  }
}
