import 'package:flutter/material.dart';
import 'package:pre_project/widgets/myDrawer.dart';
import 'package:pre_project/constants/Constants.dart';
import 'package:pre_project/widgets/CategoryView.dart';
import 'package:pre_project/widgets/product_list.dart';

class Home extends StatefulWidget {
  static const id = "homePage";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Color _bgColor = Color(0xFFEDFDEC);
  Color mainColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      drawer: MyDrawer(),
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 20.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: mainColor,
                          spreadRadius: 0.5,
                          blurRadius: 0.8,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: mainColor,
                          ),
                          onPressed: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              contentPadding: EdgeInsets.all(5.0),
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: mainColor,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75),
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
                        productCategoryList(
                            height: 70,
                            width: 60,
                            data: Constants.categoryData,
                            wide: false),
                        Constants.categoryButton(
                            category: 'Featured Products', context: context),
                        ProductList(type: 'featured'),
                        Constants.categoryButton(
                            category: 'Recommended Products', context: context),
                        ProductList(),
                        ProductList(),
                        Constants.categoryButton(
                            category: 'Popular in Your Area', context: context),
                        ProductList(),
                        Constants.categoryButton(
                            category: 'For You', context: context),
                        ProductList(),
                        Constants.categoryButton(
                            category: 'Top in Vegetables', context: context),
                        ProductList(),
                        SizedBox(height: 10),
                        Center(
                          child: TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  side: BorderSide(
                                    color: mainColor,
                                  )),
                            )),
                            child: Text(
                              'Load More',
                              style: TextStyle(
                                color: Color(0xFF5600E8),
                              ),
                            ),
                            onPressed: () {
                              // setState(() {
                              //   _loadCount++;
                              // });
                            },
                          ),
                        ),
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

  Widget productCategoryList(
      {@required double height,
      @required double width,
      bool wide,
      List<List<String>> data}) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Container(
            width: width,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Color(0xFF5600E8)),
                overlayColor: MaterialStateProperty.all(
                  Colors.yellowAccent,
                ),
                padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => CategoryView(
                              type: data[index][1],
                              imgUrl: data[index][0],
                            )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //Modified 48 --> 46 while testing on windows
                    height: 46,
                    width: 56,
                    child: Hero(
                      tag: data[index][1] + data[index][0],
                      child: Image.network(
                        data[index][0],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      data[index][1],
                      style: TextStyle(
                        fontSize: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
