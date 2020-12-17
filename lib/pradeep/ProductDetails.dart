import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  static const id = "ProductDetails";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ),
      bottomSheet: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FlatButton(
              color: Colors.lightGreenAccent,
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Call Seller'),
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              color: Colors.yellow,
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('Directions'),
              ),
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Desi Potato'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 250,
                child: Image.network(
                    'http://www.pngall.com/wp-content/uploads/2016/04/Potato-Free-Download-PNG.png'),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Price: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Text('27/Kg',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Seller: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Text('Mohan Murli',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Location: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Text('Bahuara Gate',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                  'Product Description will appear here. for exampe what exactly the product is and of which quality. bla bla bla hi hih hu hu test post hmm what is going on'),
            ],
          ),
        ),
      ),
    );
  }
}
