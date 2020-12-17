import 'package:flutter/material.dart';
import 'package:pre_project/MyHomePage.dart';
import 'package:pre_project/pradeep/ProductDetails.dart';
import 'package:pre_project/pradeep/home.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id:(context)=>MyHomePage(),
        Home.id:(context)=>Home(),
        ProductDetails.id:(context)=>ProductDetails()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(primaryColor: Colors.green),
      title: 'Pre Project',
      home: MyHomePage(),
    );
  }
}
