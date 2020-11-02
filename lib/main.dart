import 'package:flutter/material.dart';
import 'package:pre_project/MyHomePage.dart';

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
