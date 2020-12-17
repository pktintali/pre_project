import 'package:flutter/material.dart';
import 'package:pre_project/mainHomePage.dart';
import 'package:pre_project/sarthak/addproduct.dart';
import 'package:pre_project/sarthak/login_page.dart';
import 'package:pre_project/sarthak/singup.dart';
import 'package:pre_project/sarthak/user_profile.dart';
import 'package:pre_project/sarthak/vendor_profile.dart';
import 'package:pre_project/pradeep/ProductDetails.dart';
import 'package:pre_project/pradeep/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.routename,
      routes: {
        LoginPage.routename: (context) => LoginPage(),
        SignUp.routename: (context) => SignUp(),
        MainHomePage.id: (context) => MainHomePage(),
        Home.id: (context) => Home(),
        UserProfile.routename: (context) => UserProfile(),
        ProductDetails.id: (context) => ProductDetails(),
        VendorProfile.routename: (context) => VendorProfile(),
        AddProduct.routename: (context) => AddProduct(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(primaryColor: Colors.green),
      title: 'Pre Project',
      home: MainHomePage(),
    );
  }
}
