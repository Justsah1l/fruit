import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  late String _orderId = '';

  String get orderId => _orderId;

  id(String or) {
    _orderId = or;
    notifyListeners();
  }
}
