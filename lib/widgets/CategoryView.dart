import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        future: categoryFuture(products),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (_product.length <= 0) {
              snapshot.data.docs.forEach((doc) {
                Product p = new Product(
                    id: doc.id,
                    description: doc.data()["description"] ?? '',
                    price: doc.data()["price"] ?? 0,
                    vendor: doc["vendor"] ?? '',
                    vendorName: doc['vendorName'],
                    name: doc.data()["name"] ?? '',
                    timeStamp: doc["addedOn"] ?? 'NAN',
                    imgURL: doc.data()["imgURLS"],
                    brand: doc.data()['brand'] ?? 'NAN',
                    category: doc.data()['category'] ?? 'Others',
                    explainPrice: doc.data()['priceDescription'] ?? 'NAN',
                    phone: doc.data()['phones'][0],
                    dicsount: doc.data()['discount']??'NAN',
                    quantitity: doc.data()['quantitity'] ?? 'NAN',
                    vendorGeo: doc.data()['vendorGeo'],
                    vendorLocation: doc.data()['vendorLocation'] ?? 'NAN',
                    tags: doc.data()["tags"] ?? ['NAN']);
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
                // TODO: Fix hack for tiles item
                staggeredTileBuilder: (index) => StaggeredTile.fit(index != 200
                    ? 1
                    : (orientation == Orientation.portrait)
                        ? 2
                        : 4),
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Container(
                    width: 130,
                    child: Center(
                      child: ProductCardItem(
                        fromFull: true,
                        product: _product[index],
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

  Future categoryFuture(CollectionReference product) {
    switch (widget.type) {
      case 'Fruits':
        return product.where('category', isEqualTo: 'Fruits').get();
      case 'Vegetables':
        return product.where('category', isEqualTo: 'Vegetables').get();
      case 'Drinks':
        return product.where('category', isEqualTo: 'Drinks').get();
      case 'Household':
        return product.where('category', isEqualTo: 'Household').get();
      case 'Dry Fruits':
        return product.where('category', isEqualTo: 'Dry Fruits').get();
      default:
        return product.limit(15).get();
    }
  }
}
