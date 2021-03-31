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
}
