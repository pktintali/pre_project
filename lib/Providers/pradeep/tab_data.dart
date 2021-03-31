import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TabData with ChangeNotifier {
  int selectedTab = 2;
  Color tabColor = Colors.green;

  void updateTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}
