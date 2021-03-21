import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pre_project/index.dart';
import 'package:pre_project/pages/tabbar_pages/categoryPage.dart';
import 'package:pre_project/pages/product_related/addproduct.dart';
import 'package:pre_project/utils/platform_checker.dart';
import 'package:provider/provider.dart';
import 'package:pre_project/auth/auth_manager.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    bool _desktop = PlatformCheck.isDesktop(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          Consumer<UserData>(
            builder: (context, data, __) {
              if (data.user != null) {
                return UserAccountsDrawerHeader(
                    accountEmail: Text(data.user.email),
                    accountName: Text(data.user.name),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green, Colors.yellow],
                      ),
                      color: Colors.green,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/dsc_logo.jpg'),
                    ));
              } else {
                return SizedBox();
              }
            },
          ),
          _desktop
              ? ListTile(
                  title: Text('Home'),
                  leading: Icon(
                    Icons.home,
                    color: Colors.green,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Home.id);
                  },
                )
              : SizedBox(),
          ListTile(
            title: Text('Profile'),
            leading: Icon(
              Icons.person,
              color: Colors.green,
            ),
            onTap: () {
              Navigator.pushNamed(context, LandingProfile.routename);
            },
          ),
          _desktop
              ? ListTile(
                  title: Text('Category'),
                  leading: Icon(
                    Icons.category,
                    color: Colors.green,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, CategoryPage.routeName);
                  },
                )
              : SizedBox(),
          Consumer<UserData>(
            builder: (context, data, __) {
              if (data.user != null) {
                if (data.user.isVendor) {
                  return ListTile(
                    title: Text('Add Product'),
                    leading: Icon(
                      Icons.add_box_rounded,
                      color: Colors.green,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(AddProduct.routename);
                    },
                  );
                } else {
                  return SizedBox();
                }
              } else {
                return SizedBox();
              }
            },
          ),
          Consumer<UserData>(
            builder: (context, uData, __) => ListTile(
              title: Text('SignOut'),
              leading: Icon(
                Icons.logout,
                color: Colors.green,
              ),
              onTap: () {
                uData.resetUser();
                context.read<AuthManager>().signOut();
              },
            ),
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
