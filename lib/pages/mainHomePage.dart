import 'package:flutter/material.dart';
import 'package:pre_project/pages/explore_page.dart';
import 'package:pre_project/pages/home.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pre_project/pages/Alerts.dart';
import 'package:pre_project/pages/landing_profile.dart';
import 'categoryPage.dart';

class MainHomePage extends StatefulWidget {
  static const id = "home";
  @override
  _MainHomePageState createState() => _MainHomePageState();
}
//commit 2

class _MainHomePageState extends State<MainHomePage> {
  int selectedTab = 2;
  Color _tabColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    double _mdq = MediaQuery.of(context).size.width;
    return _mdq < 800
        ? Scaffold(
            backgroundColor: Color(0xFFEDFDEC),
            body: tabsWidget(),
            bottomNavigationBar: ConvexAppBar(
              items: [
                TabItem(icon: Icons.add_location_rounded, title: 'Nearby'),
                TabItem(icon: Icons.category, title: 'Category'),
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.notifications, title: 'Alerts'),
                TabItem(icon: Icons.account_circle_rounded, title: 'Profile'),
              ],
              color: Colors.white70,
              backgroundColor: _tabColor,
              initialActiveIndex: selectedTab,
              onTap: (tab) {
                setState(() {
                  selectedTab = tab;
                });
              },
            ),
          )
        : Scaffold(
            backgroundColor: Color(0xFFEDFDEC),
            body: tabsWidget(),
          );
  }

  Widget tabsWidget() {
    switch (selectedTab) {
      case 0:
        return ExplorePage();

      case 1:
        return CategoryPage();

      case 3:
        return Alerts();

      case 4:
        return LandingProfile();

      default:
        return Home();
    }
  }
}
