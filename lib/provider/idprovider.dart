import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  late String _orderId = '';

  String get orderId => _orderId;
  late String _name = '';

  String get name => _name;
  late String _address = '';

  String get address => _address;
  late String _email = '';

  String get email => _email;
  late String _dob = '';

  String get dob => _dob;
  late String _telephone = '';

  String get telephone => _telephone;
  late String _postal = '';

  String get postal => _postal;
  late String _city = '';

  String get city => _city;
  late String _country = '';

  String get country => _country;

  id(String or) {
    _orderId = or;
    notifyListeners();
  }

  setname(String or) {
    _name = or;
    notifyListeners();
  }

  setaddress(String or) {
    _address = or;
    notifyListeners();
  }

  setemail(String or) {
    _email = or;
    notifyListeners();
  }

  setdob(String or) {
    _dob = or;
    notifyListeners();
  }

  settele(String or) {
    _telephone = or;
    notifyListeners();
  }

  setpostal(String or) {
    _postal = or;
    notifyListeners();
  }

  setcity(String or) {
    _city = or;
    notifyListeners();
  }

  setcountry(String or) {
    _country = or;
    notifyListeners();
  }
}
