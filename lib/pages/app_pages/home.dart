import 'package:flutter/material.dart';
import 'package:pre_project/Providers/pradeep/UserData.dart';
import 'package:pre_project/constants/widgets.dart';
import 'package:pre_project/pages/app_pages/search_page.dart';
import 'package:pre_project/widgets/myDrawer.dart';
import 'package:pre_project/constants/Constants.dart';
import 'package:pre_project/widgets/product_list.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const id = "homePage";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Color _bgColor = Color(0xFFEDFDEC);
  final Color mainColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Welcome ${Provider.of<UserData>(context).user.name}'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       icon: Icon(Icons.search),
        //       onPressed: () {
        //         Navigator.pushNamed(context, SearchPage.routeName);
        //       }),
        // ],
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: _bgColor,
                    //!Main Bg Color
                  ),
                  // height: snapshot.data,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Widgets.productCategoryList(
                            height: 70,
                            width: 60,
                            data: Constants.categoryData,
                            wide: false),
                        Constants.categoryButton(
                            category: 'Newly Added', context: context),
                        ProductList(type: 'Newly Added'),
                        Constants.categoryButton(
                            category: 'Vegetables for You', context: context),
                        ProductList(type: 'Vegetables'),
                        // ProductList(),
                        Constants.categoryButton(
                            category: 'Fruits you may like', context: context),
                        ProductList(type: 'Fruits'),
                        Constants.categoryButton(
                            category: 'Households', context: context),
                        ProductList(type: 'Household'),
                        Constants.categoryButton(
                            category: 'You may also like', context: context),
                        ProductList(),
                        SizedBox(height: 10),
                        // Center(
                        //   child: TextButton(
                        //     style: ButtonStyle(
                        //         shape: MaterialStateProperty.all(
                        //       RoundedRectangleBorder(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(20)),
                        //           side: BorderSide(
                        //             color: mainColor,
                        //           )),
                        //     )),
                        //     child: Text(
                        //       'Load More',
                        //       style: TextStyle(
                        //         color: Color(0xFF5600E8),
                        //       ),
                        //     ),
                        //     onPressed: () {},
                        //   ),
                        // ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
