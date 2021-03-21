import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AuthField with ChangeNotifier {
  String name;
  String email;
  String password;
  String rePassword;
  String address;
  String mobileNo;
  bool isSeller = false;
  GeoPoint geop;

  void toogleSeller() {
    isSeller = !isSeller;
    notifyListeners();
  }

  void updatePassword(String pswd) {
    password = pswd;
    notifyListeners();
  }

  void reset() {
    name = null;
    email = null;
    password = null;
    rePassword = null;
    address = null;
    mobileNo = null;
    isSeller = false;
    geop = null;
    notifyListeners();
  }
}
