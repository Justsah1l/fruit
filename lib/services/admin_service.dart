import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> getOrder(Map<String, dynamic> orderData) async {
  final url =
      Uri.parse('https://deployment01.onrender.com/api/v1/getallorders');
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
