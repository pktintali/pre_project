import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pre_project/Providers/pradeep/current_product.dart';
import 'package:pre_project/constants/Constants.dart';
import 'package:pre_project/data/Product.dart';
import 'package:pre_project/pages/app_pages/SeeAll.dart';
import 'package:pre_project/pages/product_related/gesture_image.dart';
import 'package:pre_project/widgets/product_list.dart';
import 'package:pre_project/widgets/tags_ui.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetails extends StatelessWidget {
  // static const id = "productId";
  final String id;

  const ProductDetails({Key key, this.id}) : super(key: key);
  _callAction(String number) async {
    final url = 'tel:+91$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _directionAction({String latitude, String longitude}) async {
    final url = "geo:$latitude,$longitude?q=$latitude,$longitude(shop)";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentProduct>(
      builder: (context, data, __) {
        Product _product = data.product;
        print(data.product.name);
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 55),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                color: Color(0xFFEDFDEC),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          bottomSheet: FractionalTranslation(
            translation: Offset(0, 0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.lightGreenAccent,
                      ),
                    ),
                    onPressed: () {
                      _callAction(_product.phone);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Call Seller',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                      Colors.yellow,
                    )),
                    onPressed: () {
                      print(_product.name);
                      // print(_product.vendorGeo.latitude);
                      _directionAction(
                        latitude:
                            _product.vendorGeo.latitude.toString() ?? '80.5',
                        longitude:
                            _product.vendorGeo.longitude.toString() ?? '89.7',
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Directions',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          //
          appBar: AppBar(
            title: Text(_product.name),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        pauseAutoPlayOnTouch: true,
                        aspectRatio: 3 / 2,
                        // height: MediaQuery.of(context).size.height / 3,
                      ),
                      items: _product.imgURL.map((img) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GestureImage(
                                                url: img,
                                              )));
                                },
                                child: Image.network(
                                  img ??
                                      'https://img.pngio.com/fruit-basket-png-png-collections-at-sccprecat-fruit-basket-png-800_800.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _product.name,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
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
                                    child: Text(
                                      'New !',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text('Added On: '),
                                Text(
                                  _product.timeStamp.toDate().toString() ??
                                      'NAN',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.share,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            Share.share(
                                'I got best quality product here. You can also try https://dsc-noticeboard.web.app/',
                                subject: 'Best Quality Corn');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        ' ₹ ' + '${_product.price}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 8),
                      Text(_product.explainPrice ?? ''),
                      SizedBox(width: 60),
                      Text('QTY : ${_product.quantitity}')
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text('Discount: '),
                      SizedBox(width: 6),
                      Text(_product.dicsount ?? 'NAN'),
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 4),
                  Text(_product.description ?? 'NAN'),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Sold By:',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: 6),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SeeAll(
                                            userProducts: true,
                                            type: _product.vendorName +
                                                "'s " +
                                                'Products',
                                            vendorID: _product.vendor,
                                          )));
                            },
                            child: Chip(
                              avatar: CircleAvatar(
                                child:
                                    Text(_product.vendorName.substring(0, 1)),
                              ),
                              label: Text(_product.vendorName),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Seller Rating:',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: 6),
                          RatingBar.builder(
                            initialRating: 4.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ignoreGestures: true,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 6,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Location: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              _product.vendorLocation ?? 'NAN',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'Product Category: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            _product.category ?? 'NAN',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'Brand: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            _product.brand ?? 'NAN',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'Product Category: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            _product.category ?? 'NAN',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      TagsUI(tags: _product.tags),
                    ],
                  ),
                  SizedBox(height: 6),
                  Divider(),
                  SizedBox(height: 6),
                  Constants.categoryButton(
                      category: 'Related Items', context: context),
                  ProductList(
                    fromDetailPage: true,
                    related: _product.category,
                  ),
                  Constants.categoryButton(
                      category: 'Also Try', context: context),
                  ProductList(
                    fromDetailPage: true,
                  ),
                  // Constants.categoryButton(
                  //     category: 'Recommended Products', context: context),
                  // ProductList(
                  //   fromDetailPage: true,
                  // ),
                  SizedBox(height: 65),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget ratingContainer() {
    return Container(
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
    );
  }
}