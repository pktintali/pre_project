import 'package:flutter/material.dart';
import 'package:pre_project/constants/Constants.dart';
import 'package:pre_project/pages/app_pages/SeeAll.dart';
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

  static Widget categoryButton(
      {@required String category, BuildContext context}) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SeeAll(
                      type: category,
                    )));
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
        overlayColor: MaterialStateProperty.all(Colors.yellowAccent),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: Color(0xFF5600E8),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Color(0xFF5600E8),
              // color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  // static Widget ratingContainer() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.green,
  //       shape: BoxShape.rectangle,
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(100),
  //       ),
  //     ),
  //     height: 18,
  //     width: 37,
  //     child: Center(
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Text(
  //             '4.5',
  //             style: TextStyle(
  //               fontSize: 11,
  //               color: Colors.white,
  //             ),
  //           ),
  //           Icon(
  //             Icons.star,
  //             size: 12,
  //             color: Colors.white,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
