import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BuildBottomModal {
  Column buildBottomModal(BuildContext context) {
    return Column(
      children: [
        //shop images
        Flexible(fit: FlexFit.loose, flex: 3, child: shopImages()),

        //  SizedBox(height: 12.0),

        //rating bar and rest of the text
        Flexible(fit: FlexFit.loose, flex: 4, child: ratingBar()),

        //required buttons
        Flexible(fit: FlexFit.loose, flex: 2, child: buttons())
      ],
    );
  }

  Container buttons() {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.all(1),
              child: RaisedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Icon(
                        Icons.directions,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 3,
                      child: Text(
                        "Directions",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.blue,
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.all(1),
              child: RaisedButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_outline_sharp,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              margin: EdgeInsets.all(1),
              child: RaisedButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.share_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Share",
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container ratingBar() {
    return Container(
      margin: new EdgeInsets.only(top: 20, left: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Store Name',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          // SizedBox(height: 6.0),

          Align(
            alignment: Alignment.centerLeft,
            child: RatingBar.builder(
              initialRating: 3,
              itemCount: 5,
              // ignore: missing_return
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                }
              },
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'General Store',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Open Close Time',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView shopImages() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 150,
            child: Card(
                child: Image(
              image: AssetImage('assets/shop1.png'),
              //  fit: BoxFit.fill,
            )),
          ),
          Container(
            height: 150,
            child: Card(
                child: Image(
              image: AssetImage('assets/shop2.png'),
              //  fit: BoxFit.fill,
            )),
          ),
          Container(
            height: 150,
            child: Card(
                child: Image(
              image: AssetImage('assets/shop3.png'),
              //  fit: BoxFit.fill,
            )),
          ),
          Container(
            height: 150,
            child: Card(
                child: Image(
              image: AssetImage('assets/shop4.png'),
              //  fit: BoxFit.fill,
            )),
          ),
        ],
      ),
    );
  }
}
