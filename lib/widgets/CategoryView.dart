import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pre_project/constants/Constants.dart';
import 'package:pre_project/data/Product.dart';
import 'package:pre_project/widgets/productCardItem.dart';

class CategoryView extends StatefulWidget {
  final String type;
  final String imgUrl;
  CategoryView({this.type, this.imgUrl});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFEDFDEC),
      backgroundColor: Colors.green,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.green,
                expandedHeight: 180.0,
                floating: false,
                pinned: true,
                stretch: true,
                // snap: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      widget.type,
                      style: TextStyle(shadows: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1.0,
                          blurRadius: 1.5,
                        )
                      ]),
                    ),
                    background: Hero(
                      tag: widget.type + widget.imgUrl,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.8), BlendMode.dstATop),
                          image: NetworkImage(
                            widget.imgUrl,
                          ),
                        )),
                      ),
                    )),
              )
            ];
          },
          body: Container(
            color: Color(0xFFEDFDEC),
            child: productList(context: context),
          ),
        ),
      ),
    );
  }

  Widget productList({BuildContext context}) {
    List<Product> _product = [];
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    final orientation = MediaQuery.of(context).orientation;
    return FutureBuilder(
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
                //TODO: Fix for all items currentls missing nth item
                staggeredTileBuilder: (index) => StaggeredTile.fit(index != 0
                    ? 1
                    : (orientation == Orientation.portrait)
                        ? 2
                        : 4),
                itemBuilder: (BuildContext context, int index) => index == 0
                    ? Container(
                        color: Color(0xFFEDFDEC),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text('Top ${widget.type} sellers'),
                            SizedBox(height: 10),
                            Constants.sellerCard(),
                          ],
                        ),
                      )
                    : Card(
                        child: Container(
                          width: 130,
                          child: Center(
                            child: ProductCardItem(
                              fromFull: true,
                              product: _product[index - 1],
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
        });
  }
}
