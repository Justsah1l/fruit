import 'package:flutter/material.dart';
import 'package:fruit/models/productmod.dart';
import 'package:pinput/pinput.dart';

class Cartmodel extends ChangeNotifier {
  List<Product> _cartitems = [];
  List<Product> get cartitems => _cartitems;

  void addtocart(Product product) {
    _cartitems.add(product);
    notifyListeners();
  }

  bool isempty() {
    if (_cartitems.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void removefromcart(Product product) {
    _cartitems.remove(product);
    notifyListeners();
  }

  String calculatetotal() {
    double price = 0;
    for (int i = 0; i < _cartitems.length; i++) {
      price += _cartitems[i].price.toDouble();
    }
    return price.toStringAsFixed(2);
  }
}
