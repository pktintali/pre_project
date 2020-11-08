import 'package:flutter/material.dart';
import 'package:pre_project/pradeep/home.dart';
import 'package:pre_project/myDrawer.dart';

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
      drawer: MyDrawer(),
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
      return Center(child: Text('Tab 0'));
    } else if (selectedTab == 1) {
      return Home();
    } else
      return Center(child: Text('Tab 2'));
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
