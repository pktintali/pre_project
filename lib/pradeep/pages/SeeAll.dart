import 'package:flutter/material.dart';
import 'package:pre_project/pradeep/Constants.dart';

class SeeAll extends StatefulWidget {
  final List<List<String>> data;
  final String type;
  SeeAll({this.data, this.type});
  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: GridView.builder(
          itemCount: 10,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 4),
          itemBuilder: (BuildContext context, int index) => Card(
            child: Container(
              width: 130,
              child: Center(
                child: Constants.productCardItem(
                    context: context,
                    fromFull: true,
                    product: widget.data[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
