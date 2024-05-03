import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderService {
  Future<Map<String, dynamic>> createOrder(
      Map<String, dynamic> orderData) async {
    try {
      final response = await http.post(
        Uri.parse('https://deployment01.onrender.com/api/v1/createOrder'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(orderData),
      );

      if (response.statusCode == 201) {
        return {
          'success': true,
          'data': json.decode(response.body),
          'message': 'Order created successfully!',
        };
      } else {
        return {
          'success': false,
          'message':
              'Failed to create order. Server responded with ${response.statusCode}',
        };
      }
    } catch (error) {
      print('Error creating order: $error');
      return {
        'success': false,
        'message': 'Internal Server Error',
      };
    }
  }
}
