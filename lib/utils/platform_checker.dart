import 'package:flutter/material.dart';

class PlatformCheck {
  static bool isDesktop(BuildContext context) {
    bool _desktop = MediaQuery.of(context).size.width > 900;
    return _desktop ?? false;
  }
}
