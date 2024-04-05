import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final apiUrl = 'http://192.168.0.105:4000/api/v1/signup';

  final userProfile = {
    'uid': '123',
    'name': 'John Doe',
    'phoneNumber': '123456789',
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(userProfile),
  );

  if (response.statusCode == 200) {
    print('Request successful. Response: ${response.body}');
  } else {
    print('Error: ${response.statusCode}, ${response.reasonPhrase}');
  }
}
