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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) => Row(
            children: [
              Expanded(
                child: Card(
                  child: Container(
                    width: 130,
                    child: Center(
                      child: Constants.productCardItem(
                        context: context,
                          fromFulll: true, product: widget.data[index]),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  // color: Color(0xFFFFFCD1),
                  child: Container(
                    width: 130,
                    child: Center(
                      child: Constants.productCardItem(
                        context: context,
                          fromFulll: true, product: widget.data[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
