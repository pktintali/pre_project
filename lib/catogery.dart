import 'package:flutter/material.dart';

class Catogery extends StatefulWidget {
  @override
  _CatogeryState createState() => _CatogeryState();
}

class _CatogeryState extends State<Catogery> {
  final items = List<String>.generate(8, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}
