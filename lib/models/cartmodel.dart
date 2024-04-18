import 'package:flutter/material.dart';
import 'package:fruit/models/productmod.dart';
import 'package:pinput/pinput.dart';

class Cartmodel extends ChangeNotifier {
   
  List<Product> _cartitems = [];
  List<Product> get cartitems => _cartitems;

  List<Product> _favcartitems = [];

  List<Product> get favcartitems => _favcartitems;

  void addtocart(Product product) {
    _cartitems.add(product);
    notifyListeners();
  }

  void addtofav(Product product) {
    if (!_favcartitems.contains(product)) {
      _favcartitems.add(product);
      notifyListeners();
    }
  }

  bool isempty() {
    if (_cartitems.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  int howmany() {
    return _cartitems.length;
    notifyListeners();
  }

  void removefromcart(Product product) {
    _cartitems.remove(product);
    notifyListeners();
  }

  void removefromfav(Product product) {
    _favcartitems.remove(product);
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
