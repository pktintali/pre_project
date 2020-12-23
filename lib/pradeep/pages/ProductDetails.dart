import 'package:flutter/material.dart';
import 'package:pre_project/pradeep/Constants.dart';

class ProductDetails extends StatelessWidget {
  static const id = "ProductDetails";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 45),
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
        translation: Offset(0, 0.1),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FlatButton(
                height: 58,
                color: Colors.lightGreenAccent,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Call Seller',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                height: 58,
                color: Colors.yellow,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Directions',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Fresh Corn'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 260,
                child: Image.network(
                    'https://www.freepnglogos.com/uploads/corn-png/corn-only-organic-2.png'),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Best Quality Corn',
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
                            Text(
                              'Added 10 Hour Ago',
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
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                '₹51/Kg',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Divider(),
              SizedBox(height: 4),
              Text('A product description is the marketing copy that explains what a product is and why it\'s' +
                  ' worth purchasing. The purpose of a product description is to supply customers with important' +
                  ' information about the features and benefits of the product so they\'re compelled to buy.'),
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
                      Text(
                        '  Subham Mastana',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(width: 10),
                      ratingContainer(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Location:',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        ' BINOD Gate',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 17,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 6),
              Divider(),
              SizedBox(height: 6),
              Constants.categoryButton(
                  category: 'Customers who bought this also bought',
                  context: context),
              Constants.productCard(),
              Constants.categoryButton(
                  category: 'Similar Products', context: context),
              Constants.productCard(),
              Constants.categoryButton(
                  category: 'Recommended Products', context: context),
              Constants.productCard(),
              SizedBox(height: 65),
            ],
          ),
        ),
      ),
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
