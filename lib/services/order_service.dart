import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> createOrderApi({
  String? phoneNumber,
  List<Map<String, dynamic>>? products,
  double? totalPrice,
  String? status,
}) async {
  try {
    final String apiUrl = 'http://127.0.0.1:4000/createOrder';

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

void main() async {
  Map<String, dynamic> result = await createOrderApi(
    phoneNumber: '1234567890',
    products: [
      {
        'productId': 'product1',
        'quantity': 2,
        'price': 10.99,
      },
      {
        'productId': 'product2',
        'quantity': 1,
        'price': 5.99,
      },
    ],
    totalPrice: 27.97,
    status: 'pending',
  );
  print(result);
}
