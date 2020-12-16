import 'package:flutter/material.dart';
import 'package:pre_project/MyHomePage.dart';
import 'package:pre_project/sarthak/addproduct.dart';
import 'package:pre_project/sarthak/login_page.dart';
import 'package:pre_project/sarthak/singup.dart';
import 'package:pre_project/sarthak/user_profile.dart';
import 'package:pre_project/sarthak/vendor_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(primaryColor: Colors.green),
      title: 'Pre Project',
      home: MyHomePage(),
    );
  }
}
