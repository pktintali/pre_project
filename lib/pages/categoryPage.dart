import '../ankan/constants.dart';
import '../ankan/model/categoryData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryPage extends StatelessWidget {
  static final routeName = 'category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Container(),
        title: Text('Category'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return index != 0
                      ? Container(
                          padding: EdgeInsets.all(20),
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(categories[index - 1].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                categories[index - 1].name,
                                style: kTitleTextStyle,
                              ),
                              Text(
                                '${categories[index - 1].numOfShops} Shops',
                                style: TextStyle(
                                  color: kTextColor.withOpacity(.5),
                                ),
                              )
                            ],
                          ),
                        )
                      : topWidget();
                },
                staggeredTileBuilder: (index) =>
                    StaggeredTile.fit(index != 0 ? 1 : 2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topWidget() {
    return Column(
      children: [
        SizedBox(height: 30),
        Text("Hey User,", style: kHeadingextStyle),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F7),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.search),
              SizedBox(width: 16),
              Text(
                "Search for any category",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFA0A5BD),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Category", style: kTitleTextStyle),
            Text(
              "See All",
              style: kSubtitleTextSyule.copyWith(color: kBlueColor),
            ),
          ],
        ),
        // SizedBox(height: 30),
      ],
    );
  }
}
