import 'package:pre_project/constants/Constants.dart';
import 'package:pre_project/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryPage extends StatelessWidget {
  static final routeName = 'category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Container(),
        title: Text('Browse By Category'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: MediaQuery.of(context).size.height <
                          MediaQuery.of(context).size.width
                      ? 4
                      : 2,
                  itemCount: 10,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      name: Constants.categoryData[index][1],
                      img: Constants.categoryData[index][0],
                    );
                  },
                  staggeredTileBuilder: (index) => index != 999
                      ? StaggeredTile.fit(1)
                      : StaggeredTile.fit(4)),
            ),
          ],
        ),
      ),
    );
  }

  // Widget topWidget() {
  //   return Column(
  //     children: [
  //       SizedBox(height: 30),
  //       Text("Hey User,", style: kHeadingextStyle),
  //       Container(
  //         margin: EdgeInsets.symmetric(vertical: 30),
  //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  //         height: 60,
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //           color: Color(0xFFF5F5F7),
  //           borderRadius: BorderRadius.circular(40),
  //         ),
  //         child: Row(
  //           children: <Widget>[
  //             Icon(Icons.search),
  //             SizedBox(width: 16),
  //             Text(
  //               "Search for any category",
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 color: Color(0xFFA0A5BD),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: <Widget>[
  //           Text("Category", style: kTitleTextStyle),
  //           Text(
  //             "See All",
  //             style: kSubtitleTextSyule.copyWith(color: kBlueColor),
  //           ),
  //         ],
  //       ),
  //       // SizedBox(height: 30),
  //     ],
  //   );
  // }
}
