import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pre_project/data/Product.dart';
import 'package:pre_project/utils/platform_checker.dart';
import 'package:pre_project/widgets/productCardItem.dart';

class ProductList extends StatelessWidget {
  final String type;
  const ProductList({Key key, this.type = 'default'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Product> _product = [];
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    return SizedBox(
      height: PlatformCheck.isDesktop(context) ? 180 : 145,
      child: FutureBuilder(
          future: myFuture(products, type: type),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              snapshot.data.docs.forEach((doc) {
                Product p = new Product(
                    // id: doc["id"] ?? '',
                    description: doc["description"] ?? '',
                    price: doc["price"] ?? '',
                    vendor: doc["vendorName"] ?? '',
                    name: doc["name"] ?? '',
                    timeStamp: doc["addedOn"] ?? '',
                    imgURL: doc["imgURLS"],
                    phone: doc['phones'][0],
                    // vendorLocation: doc['vendorLocation'],
                    tags: doc["tags"] ?? '');
                // print(p.id);
                _product.add(p);
              });
              return ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _product.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  // color: Color(0xFFFFFCD1),
                  child: Container(
                    width: PlatformCheck.isDesktop(context) ? 160 : 130,
                    child: Center(
                      child: ProductCardItem(product: _product[index]),
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

myFuture(CollectionReference products, {String type}) {
  switch (type) {
    case 'featured':
      return products
          .limit(type == 'featured' ? 5 : 10)
          .where('vendor', isEqualTo: '4gpradeep@gmail.com')
          .get();
    default:
      return products.limit(5).get();
  }
}
