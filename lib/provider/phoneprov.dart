import 'package:flutter/material.dart';

class NumberProvider with ChangeNotifier {
  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String newPhoneNumber) {
    _phoneNumber = newPhoneNumber;
    notifyListeners();
  }
}
