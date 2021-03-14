import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pre_project/Providers/pradeep/UserData.dart';
import 'package:pre_project/data/MyUser.dart';
import 'package:pre_project/pages/addproduct.dart';
import 'package:pre_project/widgets/rating_icon.dart';

class VendorProfile extends StatelessWidget {
  final UserData data;
  static const routename = '/vendorprofile';

  const VendorProfile({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyUser u = data.user;
    return SingleChildScrollView(
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
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
            ),
            ButtonBar(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('My Products')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddProduct.routename);
                    },
                    child: Text('Add Products')),
              ],
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(0.0),
              leading: Icon(
                Icons.person,
                color: Colors.green,
                size: 28.0,
              ),
              title: Text('Username'),
              subtitle: Text(u.name),
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
              subtitle: Text(u.about),
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
              subtitle: Text(u.phones[0]),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(0.0),
              leading: Icon(
                Icons.email,
                color: Colors.green,
                size: 28.0,
              ),
              title: Text('Email'),
              subtitle: Text(u.userID),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(0.0),
              leading: Icon(
                Icons.attach_money_rounded,
                color: Colors.green,
                size: 28.0,
              ),
              title: Text('UPI Available'),
              subtitle: Text(u.isUPI ? 'YES' : 'NO' ?? 'NO'),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(0.0),
              leading: Icon(
                Icons.language,
                color: Colors.green,
                size: 28.0,
              ),
              title: Text('Preferred Language'),
              subtitle: Text(u.language ?? 'NOT PROVIDED'),
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
              subtitle: Text(u.address ?? 'NOT PROVIDED'),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
          ],
        ),
      ),
    );
  }
}
