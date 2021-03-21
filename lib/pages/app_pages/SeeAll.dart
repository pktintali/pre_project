import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pre_project/Providers/pradeep/UserData.dart';
import 'package:pre_project/data/Product.dart';
import 'package:pre_project/widgets/productCardItem.dart';
import 'package:provider/provider.dart';

class SeeAll extends StatelessWidget {
  final List<List<String>> data;
  final String type;
  final bool userProducts;
  final String vendorID;
  SeeAll({this.data, this.type, this.userProducts = false, this.vendorID});

  @override
  Widget build(BuildContext context) {
    List<Product> _product = [];
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(type),
        centerTitle: true,
      ),
      body: Consumer<UserData>(builder: (context, data, __) {
        String _vID = vendorID ?? data.user.email;
        return FutureBuilder(
            future: userProducts
                ? products.where('vendor', isEqualTo: _vID).get()
                : products.get(),
            builder: (context, snapshot) {
              print(data.user.email);
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                if (_product.length <= 0) {
                  snapshot.data.docs.forEach((doc) {
                    print(doc['vendorGeo'].latitude);
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
                        vendorGeo: doc.data()['vendorGeo'],
                        quantitity: doc.data()['quantitity']??'NAN',
                        vendorLocation: doc.data()['vendorLocation'] ?? 'NAN',
                        tags: doc.data()["tags"] ?? ['NAN']);
                    print(doc.id);
                    _product.add(p);
                  });
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.all(0),
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 4,
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
            });
      }),
    );
  }
}
