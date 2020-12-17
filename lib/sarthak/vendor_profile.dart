import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorProfile extends StatelessWidget {
  static const routename = '/vendorprofile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        actions: [IconButton(icon: Icon(Icons.edit_rounded), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.green,
                    radius: MediaQuery.of(context).size.height * 0.09,
                    backgroundColor: Colors.yellow,
                    backgroundImage: AssetImage("assets/images/userimage.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: Text(
                          '  Ravi Kumar',
                          textScaleFactor: 1.4,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: Text(
                          '  Vegetable Seller',
                          style: TextStyle(color: Colors.black54),
                          textScaleFactor: 1.2,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.48,
                        child: Text(
                          '  My Ratings 4.8',
                          textScaleFactor: 1.2,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
              ),
              Divider(),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.supervised_user_circle,
                        color: Colors.green,
                        size: 28.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "ravi_1234",
                                //textScaleFactor: 1.4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.description_rounded,
                        color: Colors.green,
                        size: 28.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bio',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "A vegetable seller. A place for fresh vegetables and fruits.",
                                //textScaleFactor: 1.4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Divider(),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_android_rounded,
                        color: Colors.green,
                        size: 28.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "99XXXX9999",
                                //textScaleFactor: 1.4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "88XXXX8888",
                                //textScaleFactor: 1.4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.email_rounded,
                        color: Colors.green,
                        size: 28.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "abc_vegetables@gmail.com",
                                //textScaleFactor: 1.4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Divider(),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                        color: Colors.green,
                        size: 28.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'UPI ID',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "ravi@abcbank",
                                //textScaleFactor: 1.4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.text_format_rounded,
                        color: Colors.green,
                        size: 28.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Preferred Language',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                "English",
                                //textScaleFactor: 1.4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Divider(),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: Colors.green,
                        size: 28.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Text(
                              'Lane 2,\nABC Market,\nNew Delhi',
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              RaisedButton(
                child: Text('My Products'),
                onPressed: () {
                  Navigator.pushNamed(context, '/userprofile');
                },
                color: Colors.lightGreenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
