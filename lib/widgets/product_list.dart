import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pre_project/data/Product.dart';
import 'package:pre_project/utils/platform_checker.dart';
import 'package:pre_project/widgets/productCardItem.dart';

class ProductList extends StatelessWidget {
  final String type;
  final bool fromDetailPage;
  final String related;
  const ProductList({
    Key key,
    this.type = 'default',
    this.fromDetailPage = false,
    this.related,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Product> _product = [];
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    return SizedBox(
      height: PlatformCheck.isDesktop(context) ? 180 : 145,
      child: FutureBuilder(
          future: myFuture(products, type: related ?? type),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
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
                    quantitity: doc.data()['quantitity'] ?? 'NAN',
                    brand: doc.data()['brand'] ?? 'NAN',
                    category: doc.data()['category'] ?? 'Others',
                    explainPrice: doc.data()['priceDescription'] ?? 'NAN',
                    phone: doc.data()['phones'][0],
                    dicsount: doc.data()['discount'] ?? 'NAN',
                    vendorGeo: doc.data()['vendorGeo'],
                    vendorLocation: doc.data()['vendorLocation'] ?? 'NAN',
                    tags: doc.data()["tags"] ?? ['NAN']);
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
                      child: ProductCardItem(
                        product: _product[index],
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

myFuture(CollectionReference products, {String type, String category}) {
  switch (type) {
    case 'Newly Added':
      return products.orderBy('addedOn', descending: true).limit(10).get();
    case 'something':
      return products
          .limit(10)
          .where('category', isEqualTo: 'Vegetables')
          .get();
    case 'area':
      return products
          .limit(10)
          .where('vendor', isEqualTo: '4gpradeep@gmail.com')
          .get();
    case 'new':
      return products
          .limit(10)
          .where('vendor', isEqualTo: '4gpradeep@gmail.com')
          .get();
    case 'Fruits':
      return products
          .orderBy('addedOn', descending: true)
          .limit(10)
          .where('category', isEqualTo: 'Fruits')
          .get();
    case 'Vegetables':
      return products
          .orderBy('addedOn', descending: true)
          .limit(10)
          .where('category', isEqualTo: 'Vegetables')
          .get();
    case 'Drinks':
      return products.limit(10).where('category', isEqualTo: 'Drinks').get();
    case 'Household':
      return products
          .orderBy('addedOn', descending: true)
          .limit(10)
          .where('category', isEqualTo: 'Household')
          .get();
    case 'Fruits':
      return products.limit(10).where('category', isEqualTo: 'Fruits').get();
    case 'Electronics':
      return products
          .limit(10)
          .where('category', isEqualTo: 'Electronics')
          .get();
    default:
      return products.limit(10).get();
  }
}
