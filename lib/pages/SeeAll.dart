import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pre_project/data/Product.dart';
import 'package:pre_project/widgets/productCardItem.dart';

class SeeAll extends StatefulWidget {
  final List<List<String>> data;
  final String type;
  SeeAll({this.data, this.type});
  @override
  _SeeAllState createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  List<Product> _product = [];
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.type),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: products.get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              if (_product.length <= 0) {
                snapshot.data.docs.forEach((doc) {
                  Product p = new Product(
                      // id: doc["id"],
                      description: doc["description"],
                      price: doc["price"],
                      // vendor: doc["vendor"],
                      name: doc["name"],
                      // timeStamp: doc["addedOn"].toString(),
                      imgURL: doc["imgURLS"],
                      tags: doc["tags"]);
                  print(p.id);
                  _product.add(p);
                });
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(0),
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 4,
                  itemCount: _product.length,
                  physics: BouncingScrollPhysics(),
                  // crossAxisSpacing: 20,
                  // mainAxisSpacing: 20,
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.fit(index != 200
                          ? 1
                          : (orientation == Orientation.portrait)
                              ? 2
                              : 4),
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Container(
                      width: 130,
                      child: Center(
                        child: ProductCardItem(
                          product: _product[index],
                          fromFull: true,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          }),
    );
  }
}
