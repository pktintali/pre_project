import 'package:flutter/material.dart';
import 'package:pre_project/pradeep/Constants.dart';
import 'package:pre_project/pradeep/ProductDetails.dart';

class Home extends StatefulWidget {
  static const id = "Home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Featured Products',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              productList(height: 150, width: 250, wide: true),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recommended Products',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              productList(height: 120, width: 120, wide: false),
              productList(height: 120, width: 120, wide: false),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Popular in Your Area',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              productList(height: 150, width: 250, wide: true),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'For You',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              productList(height: 120, width: 120, wide: false),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Top in Vegetables',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              productList(height: 120, width: 120, wide: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget productList(
      {@required double height, @required double width, bool wide}) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 11,
        itemBuilder: (BuildContext context, int index) => Card(
          color: Color(0xFFFFFCD1),
          child: Container(
            width: width,
            child: Center(
              child: items(wide: wide, product: Constants.products[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget items({@required bool wide, List<String> product}) {
    return wide ? wideCard(product: product) : miniCard(product: product);
  }

  Widget wideCard({@required List<String> product}) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, ProductDetails.id);
      },
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: Image.network(
                  product[0],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            width: 1.2,
            color: Colors.lightGreen,
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product[1],
                    ),
                    Text(
                      product[2],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget miniCard({@required List<String> product}) {
    return RawMaterialButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 110,
                width: 118,
                child: Image.network(
                  product[0],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
