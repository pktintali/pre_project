import 'package:flutter/material.dart';
class Catogery extends StatefulWidget {
  @override
  _CatogeryState createState() => _CatogeryState();
}

class _CatogeryState extends State<Catogery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Center(
        child:Text('Tab 2'),
      )
    );
  }
}
