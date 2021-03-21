import 'package:flutter/foundation.dart';
import 'package:pre_project/index.dart';

class EditProfileMode with ChangeNotifier {
  bool editMode = false;
  String userName;
  String about;
  List mobile;
  bool upi;
  String language;
  GeoPoint gPoint;
  String address;
  void toogleEditMode() {
    editMode = !editMode;
    notifyListeners();
  }

  void updateUPI(bool u, {bool update=false}) {
    upi = u;
    if (update) {
      notifyListeners();
    }
  }
}
