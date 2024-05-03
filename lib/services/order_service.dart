import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> createOrderApi({
  String? phoneNumber,
  List<Map<String, dynamic>>? products,
  double? totalPrice,
  String? status,
}) async {
  try {
    final String apiUrl = 'https://deployment01.onrender.com/createOrder';

    Map<String, dynamic> requestBody = {
      'phoneNumber': phoneNumber,
      'products': products,
      'totalPrice': totalPrice,
      'status': status,
    };
    String requestBodyJson = json.encode(requestBody);
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: requestBodyJson,
    );
    Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 201 && responseData['success']) {
      return {
        'success': true,
        'data': responseData['data'],
        'id': responseData['id'],
        'message': responseData['message'],
      };
    } else {
      return {
        'success': false,
        'message': responseData['message'] ?? 'Error creating order',
      };
    }
  } catch (error) {
    print(error);
    return {
      'success': false,
      'message': 'Internal Server Error',
    };
  }
}
