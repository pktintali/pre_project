import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserProfile extends StatelessWidget {
  static const routename = '/userprofile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        actions: [
          IconButton(icon: Icon(Icons.edit_rounded), onPressed: (){})
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(5.0),),
              Row(
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.green,
                    radius: MediaQuery.of(context).size.height*0.09,
                    backgroundColor: Colors.yellow,
                    backgroundImage: AssetImage("assets/images/userimage.png"),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),),
                  Container(
                    width: MediaQuery.of(context).size.width*0.48,
                    child: Text('  Shubham Kumar',
                      textScaleFactor: 1.4,
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5.0),),
              Divider(),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(Icons.supervised_user_circle,color: Colors.green,size: 28.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Username',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),),
                            Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text("shubham_1234",
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
                  )
              ),
              Divider(),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(Icons.phone_android_rounded,color: Colors.green,size: 28.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Phone',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),),
                            Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text("99XXXX8888",
                                //textScaleFactor: 1.4,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                            Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text("88XXXX7777",
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
                  )
              ),
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(Icons.email_rounded,color: Colors.green,size: 28.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                color: Colors.green,
                              ),),
                            Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text("shubham_abc@gmail.com",
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
                  )
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

