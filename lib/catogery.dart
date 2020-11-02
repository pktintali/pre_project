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
          Text('First Item'),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${items[index]}'),
                );
              },
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Cate 2'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${items[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
