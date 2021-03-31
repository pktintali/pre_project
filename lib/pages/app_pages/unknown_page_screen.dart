import 'package:flutter/material.dart';

class UnknownPageScreen extends StatelessWidget {
  final RouteSettings settings;

  const UnknownPageScreen({Key key, this.settings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OOps Incorrect URL'),
      ),
      body: Container(),
    );
  }
}
