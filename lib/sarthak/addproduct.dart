import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  static const routename = '/addProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add a Product",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            //fontSize: 20.0,
            //fontFamily: 'MarckScript',
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                ),
                Padding(padding: EdgeInsets.all(2.0)),
                Text(
                  "Enter the details of your Product",
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 12)),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' Product Name',
                      hintText: ' Product Name',
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' Price',
                      hintText: ' Price',
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' Explain Price',
                      hintText: ' Explain Price',
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' Quantity',
                      hintText: ' Quantity',
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' Discount (if any)',
                      hintText: ' Discount',
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' Category (Optional)',
                      hintText: ' Category',
                    ),
                  ),
                ),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' Brand (Optional)',
                      hintText: ' Brand',
                    ),
                  ),
                ),
                //Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: ' Product Id (Optional)',
                      hintText: ' Barcode/Local ',
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 150,
                    child: TextField(
                      //textAlign: TextAlign.center,
                      autocorrect: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: ' Description',
                        hintText: ' Describe your Product',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  child: OutlineButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_camera_rounded,
                          size: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                          ),
                        ),
                        Text(
                          ' Add photos of your product',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                RaisedButton(
                  child: Text(
                    'Post this Product for sale',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {},
                  color: Colors.yellow,
                  splashColor: Colors.lightGreen,
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
