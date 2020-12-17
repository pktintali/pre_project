import 'package:flutter/material.dart';
import 'package:pre_project/pradeep/Constants.dart';
// import 'package:pre_project/pradeep/ProductDetails.dart';

class Home extends StatefulWidget {
  static const id = "Home";

  @override
  _HomeState createState() => _HomeState();
}
//comment
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              productCategoryList(height: 70, width: 60, wide: false),
              Constants.categoryButton(category: 'Featured Products'),
              productCard(),
              Constants.categoryButton(category: 'Recommended Products'),
              productCard(),
              productCard(),
              Constants.categoryButton(category: 'Popular in Your Area'),
              productCard(),
              Constants.categoryButton(category: 'For You'),
              productCard(),
              Constants.categoryButton(category: 'Top in Vegetables'),
              productCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget productCategoryList(
      {@required double height, @required double width, bool wide}) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) => Card(
          // color: Color(0xFFFFFCD1),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Constants.myIcons(index)),
                  Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 9,
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

  Widget productCard() {
    return SizedBox(
      height: 145,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) => Card(
          // color: Color(0xFFFFFCD1),
          child: Container(
            width: 130,
            child: Center(
              child: productCardItem(product: Constants.products[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget productCardItem({List<String> product}) {
    return RawMaterialButton(
      onPressed: () {},
      child: Column(
        children: [
          Container(
            height: 85,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(
                product[0],
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 6),
          Center(child: Text(product[1])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  height: 18,
                  width: 37,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(product[2])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
