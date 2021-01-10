import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pre_project/sarthak/addproduct.dart';
import 'package:pre_project/sarthak/vendor_profile.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.yellow],
              ),
              color: Colors.green,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  'https://yt3.ggpht.com/a/AATXAJwpODycP3kKW-pRyGxhhoO9zsO9z54KS1xWsTVB9Q=s240-c-k-c0xffffffff-no-rj-mo'),
            ),
            accountName: Text('Pradeep Tintali'),
            accountEmail: Text('pktintali@gmail.com'),
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(
              Icons.person,
              color: Colors.green,
            ),
            onTap: () {
              Navigator.pushNamed(context, VendorProfile.routename);
            },
          ),
          ListTile(
            title: Text('Favorites'),
            leading: Icon(
              Icons.favorite,
              color: Colors.green,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Add Product'),
            leading: Icon(
              Icons.add_box_rounded,
              color: Colors.green,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AddProduct.routename);
            },
          ),
          ListTile(
            title: Text('SignOut'),
            leading: Icon(
              Icons.logout,
              color: Colors.green,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Help'),
            leading: Icon(
              Icons.help,
              color: Colors.green,
            ),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Settings'),
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          AboutListTile(
            icon: Icon(Icons.info_outline, color: Colors.black),
            applicationName: 'Pre Project',
            applicationIcon: Image.network(
              'https://pbs.twimg.com/profile_images/1092180043252543489/dhvinD0d.jpg',
              width: 110,
            ),
            applicationLegalese: '@Copyrights DSC',
            applicationVersion: '0.0.0.1',
            child: Text('About'),
          )
        ],
      ),
    );
  }
}
