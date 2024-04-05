import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class OtpService {
  static const String apiUrl = 'http://192.168.1.6:4000';

  Future<bool> sendOtp(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.6:4000/api/v1/sendotp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phoneNumber': phoneNumber}),
      );

      if (response.statusCode == 200) {
        print('OTP sent successfully');
        return true; // Indicate success
      } else {
        print('Failed to send OTP. Status code: ${response.statusCode}');
        print('Server response: ${response.body}');
        return false; // Indicate failure
      }
    } catch (e) {
      print('Error: $e');
      return false; // Indicate failure
    }
  }

  Future<int> verifyOtp(String phoneNumber, String otp) async {
    print('Request Body: ${jsonEncode({
          'phoneNumber': phoneNumber,
          'otp': otp
        })}');

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.6:4000/api/v1/verifyotp'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phoneNumber': phoneNumber, 'otp': otp}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // return data['success'] ?? 0;
        return 0;
      } else if (response.statusCode == 302) {
        return 1;
      } else {
        print('Failed to verify OTP. Status code: ${response.statusCode}');
        print('Server response: ${response.body}');
        return 2;
      }
    } catch (e) {
      print('Error: $e');
      return -1;
    }
  }

  Future<int> signup(
      String name, String phoneNumber, String email, String role) async {
    print('Request Body: ${jsonEncode({
          'name': name,
          'phoneNumber': phoneNumber,
          'email': email,
          'role': role,
        })}');

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.6:4000/api/v1/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'phoneNumber': phoneNumber,
          'email': email,
          'role': role,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // return data['success'] ?? 0;
        return 0;
      } else if (response.statusCode == 302) {
        return 1;
      } else {
        print('Failed to signup. Status code: ${response.statusCode}');
        print('Server response: ${response.body}');
        return 2;
      }
    } catch (e) {
      print('Error: $e');
      return -1;
    }
  }
}
