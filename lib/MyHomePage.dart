import 'package:flutter/material.dart';
import 'package:pre_project/pradeep/home.dart';
import 'package:pre_project/myDrawer.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pre_project/vartul/explore.dart';

class MyHomePage extends StatefulWidget {
  static const id = "MyHomePage";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTab = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDFDEC),
      body: tabsWidget(),
      appBar: tabsAppBar(),
      drawer: MyDrawer(),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.add_location_rounded, title: 'Nearby'),
          TabItem(icon: Icons.category, title: 'Category'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Help'),
          TabItem(icon: Icons.account_circle_rounded, title: 'Profile'),
        ],
        color: Colors.white70,
        backgroundColor: Colors.green,
        initialActiveIndex: selectedTab,
        onTap: (tab) {
          setState(() {
            selectedTab = tab;
          });
        },
      ),
    );
  }

  Widget tabsWidget() {
    switch (selectedTab) {
      case 0:
        return Explore();

      case 1:
        return Center(child: Text('Category Tab'));

      case 3:
        return Center(child: Text('Help Tab'));

      case 4:
        return Center(child: Text('Profile Tab'));

      default:
        return Home();
    }
  }

  Widget tabsAppBar() {
    switch (selectedTab) {
      case 0:
        return AppBar(
          title: Text('Nearby'),
          centerTitle: true,
        );

      case 1:
        return AppBar(
          title: Text('Category'),
          centerTitle: true,
        );
      case 3:
        return AppBar(
          title: Text('Help'),
          centerTitle: true,
        );

      case 4:
        return AppBar(
          title: Text('Profile'),
          centerTitle: true,
        );
      default:
        return AppBar(
          title: Text('Welcome'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        );
    }
  }
}
