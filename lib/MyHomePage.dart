import 'package:flutter/material.dart';
import 'package:pre_project/home.dart';
import 'package:pre_project/catogery.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTab = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabsWidget(),
      appBar: tabsAppBar(),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (tab) {
          setState(() {
            selectedTab = tab;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
        ],
      ),
    );
  }

  Widget tabsWidget() {
    if (selectedTab == 0) {
      return Text('Tab 0');
    } else if (selectedTab == 1) {
      return Home();
    } else
      return Catogery();
  }

  Widget tabsAppBar() {
    if (selectedTab == 0) {
      return AppBar(
        title: Text('Explore'),
        centerTitle: true,
      );
    } else if (selectedTab == 2) {
      return AppBar(
        title: Text('Category'),
        centerTitle: true,
      );
    } else {
      return AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      );
    }
  }
}
