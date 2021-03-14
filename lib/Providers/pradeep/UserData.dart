import 'package:flutter/cupertino.dart';
import 'package:pre_project/data/MyUser.dart';

class UserData with ChangeNotifier {
  MyUser user;

  void updateUser(MyUser u) {
    user = u;
  }

  void resetUser() {
    user = null;
    notifyListeners();
  }
}
