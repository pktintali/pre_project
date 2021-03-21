import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pre_project/Providers/pradeep/UserData.dart';
import 'package:pre_project/Providers/utils_provider/EditProfileMode.dart';
import 'package:pre_project/data/MyUser.dart';
import 'package:pre_project/firebase/firebase.dart';
import 'package:pre_project/pages/app_pages/SeeAll.dart';
import 'package:pre_project/pages/product_related/addproduct.dart';
import 'package:pre_project/widgets/rating_icon.dart';
import 'package:provider/provider.dart';

class VendorProfile extends StatelessWidget {
  final UserData data;

  const VendorProfile({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyUser u = data.user;

    return SingleChildScrollView(
      child: ChangeNotifierProvider(
        create: (context) => EditProfileMode(),
        child: Consumer<EditProfileMode>(builder: (context, modeData, __) {
          if (modeData.upi == null) {
            modeData.updateUPI(u.isUPI);
          }
          return Container(
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
                      backgroundImage:
                          AssetImage("assets/images/userimage.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            u.name,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(' Vegetable Seller',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey,
                              )),
                          Row(
                            children: [
                              Text(' Rating', style: TextStyle(fontSize: 18)),
                              SizedBox(width: 10),
                              RatingIcon(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                ),
                !modeData.editMode
                    ? ButtonBar(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                modeData.toogleEditMode();
                              },
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SeeAll(
                                              userProducts: true,
                                              type: 'My Products',
                                            )));
                              },
                              child: Text('My Products')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AddProduct.routename);
                              },
                              child: Text('Add Products')),
                        ],
                      )
                    : SizedBox(),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 28.0,
                  ),
                  title: Text('Username'),
                  subtitle: !modeData.editMode
                      ? Text(u.name)
                      : TextField(
                          decoration: iDecoration(fieldName: u.name),
                          onChanged: (v) {
                            modeData.userName = v;
                          },
                        ),
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Icon(
                    Icons.description,
                    color: Colors.green,
                    size: 28.0,
                  ),
                  title: Text('About'),
                  subtitle: !modeData.editMode
                      ? Text(u.about)
                      : TextField(
                          decoration: iDecoration(fieldName: u.about),
                          onChanged: (v) {
                            modeData.about = v;
                          },
                        ),
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Icon(
                    Icons.phone,
                    color: Colors.green,
                    size: 28.0,
                  ),
                  title: Text('Mobile'),
                  subtitle: !modeData.editMode
                      ? Text(u.phones[0])
                      : TextField(
                          decoration: iDecoration(fieldName: u.phones[0]),
                          onChanged: (v) {
                            modeData.mobile = [v];
                          },
                        ),
                ),
                !modeData.editMode ? Divider() : SizedBox(),
                !modeData.editMode
                    ? ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        leading: Icon(
                          Icons.email,
                          color: Colors.green,
                          size: 28.0,
                        ),
                        title: Text('Email'),
                        subtitle: Text(u.userID),
                      )
                    : SizedBox(),
                Divider(),
                ListTile(
                    contentPadding: EdgeInsets.all(0.0),
                    leading: Icon(
                      Icons.attach_money_rounded,
                      color: Colors.green,
                      size: 28.0,
                    ),
                    title: Text('UPI Available'),
                    subtitle: !modeData.editMode
                        ? Text(u.isUPI ? 'YES' : 'NO' ?? 'NO')
                        : Row(
                            children: [
                              Text('No'),
                              CupertinoSwitch(
                                  value: modeData.upi,
                                  onChanged: (v) {
                                    modeData.updateUPI(v, update: true);
                                  }),
                              Text('YES'),
                            ],
                          )),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Icon(
                    Icons.language,
                    color: Colors.green,
                    size: 28.0,
                  ),
                  title: Text('Preferred Language'),
                  subtitle: !modeData.editMode
                      ? Text(u.language ?? 'NOT PROVIDED')
                      : TextField(
                          decoration: iDecoration(fieldName: u.language),
                          onChanged: (v) {
                            modeData.language = v;
                          },
                        ),
                ),
                Divider(),
                ListTile(
                  contentPadding: EdgeInsets.all(0.0),
                  leading: Icon(
                    Icons.location_city_rounded,
                    color: Colors.green,
                    size: 28.0,
                  ),
                  title: Text('Address'),
                  subtitle: !modeData.editMode
                      ? Text(u.address ?? 'NOT PROVIDED')
                      : TextField(
                          decoration: iDecoration(fieldName: u.address),
                          onChanged: (v) {
                            modeData.address = v;
                          },
                        ),
                ),
                modeData.editMode ? Divider() : SizedBox(),
                modeData.editMode
                    ? ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.green.shade800)),
                        child: Text('Update'),
                        onPressed: () async {
                          await FirebaseWork().updateUser(
                            email: u.email,
                            name: modeData.userName ?? u.name ?? 'NAN',
                            address: modeData.address ?? u.address ?? 'NAN',
                            about: modeData.about ?? u.about ?? 'NAN',
                            upi: modeData.upi ?? u.isUPI ?? false,
                            gPoint: modeData.gPoint ??
                                u.geoPoint ??
                                GeoPoint(37.7749, -122.4194),
                            language: modeData.language ?? u.language ?? 'NAN',
                            mobileNo: modeData.mobile ?? u.phones ?? ['NAN'],
                          );
                          MyUser _updatedUser = MyUser(
                            name: modeData.userName ?? u.name,
                            about: modeData.about ?? u.about,
                            address: modeData.address ?? u.address ?? 'NAN',
                            geoPoint: modeData.gPoint ?? u.geoPoint,
                            isUPI: modeData.upi ?? u.isUPI,
                            email: u.email,
                            isVendor: u.isVendor,
                            language: modeData.language ?? u.language,
                            phones: modeData.mobile ?? u.phones,
                            userID: u.userID,
                            vendorRating: u.vendorRating,
                          );
                          data.falseRefresh(_updatedUser);
                          modeData.toogleEditMode();
                        },
                      )
                    : SizedBox(),
                modeData.editMode
                    ? ElevatedButton(
                        onPressed: () {
                          //ToDO Clear Mode Data As well
                          modeData.toogleEditMode();
                        },
                        child: Text('Cancel'))
                    : SizedBox(),
                Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              ],
            ),
          );
        }),
      ),
    );
  }

  InputDecoration iDecoration({@required String fieldName}) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        contentPadding: EdgeInsets.all(2.0),
        hintText: fieldName);
  }
}
