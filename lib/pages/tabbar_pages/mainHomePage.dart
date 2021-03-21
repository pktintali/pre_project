import 'package:flutter/material.dart';
import 'package:pre_project/Providers/pradeep/tab_data.dart';
import 'package:pre_project/pages/tabbar_pages/explore_page.dart';
import 'package:pre_project/pages/app_pages/home.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pre_project/pages/tabbar_pages/Alerts.dart';
import 'package:pre_project/pages/profile_pages/landing_profile.dart';
import 'package:pre_project/utils/platform_checker.dart';
import 'package:provider/provider.dart';
import 'categoryPage.dart';

class MainHomePage extends StatelessWidget {
  static const id = 'home_page';
  @override
  Widget build(BuildContext context) {
    bool _desktop = PlatformCheck.isDesktop(context);
    return Consumer<TabData>(
      builder: (context, tabData, __) => !_desktop
          ? Scaffold(
              backgroundColor: Color(0xFFEDFDEC),
              body: tabsWidget(tabData.selectedTab),
              bottomNavigationBar: ConvexAppBar(
                items: [
                  TabItem(icon: Icons.favorite, title: 'Favourits'),
                  TabItem(icon: Icons.category, title: 'Category'),
                  TabItem(icon: Icons.home, title: 'Home'),
                  TabItem(icon: Icons.notifications, title: 'Alerts'),
                  TabItem(icon: Icons.account_circle_rounded, title: 'Profile'),
                ],
                color: Colors.white70,
                backgroundColor: tabData.tabColor,
                initialActiveIndex: tabData.selectedTab,
                onTap: (tab) {
                  tabData.updateTab(tab);
                },
              ),
            )
          : Scaffold(
              backgroundColor: Color(0xFFEDFDEC),
              body: tabsWidget(tabData.selectedTab),
            ),
    );
  }

  Widget tabsWidget(int index) {
    switch (index) {
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
