import 'package:flutter/material.dart';
import 'package:pre_project/widgets/CategoryView.dart';

class Widgets {
  static Widget productCategoryList(
      {@required double height,
      @required double width,
      bool wide,
      List<List<String>> data}) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Container(
            width: width,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Color(0xFF5600E8)),
                overlayColor: MaterialStateProperty.all(
                  Colors.yellowAccent,
                ),
                padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CategoryView(
                              type: data[index][1],
                              imgUrl: data[index][0],
                            )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //Modified 48 --> 46 while testing on windows
                    height: 46,
                    width: 56,
                    child: Hero(
                      tag: data[index][1] + data[index][0],
                      child: Image.network(
                        data[index][0],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      data[index][1],
                      style: TextStyle(
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
