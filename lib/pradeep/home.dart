import 'package:flutter/material.dart';
import 'package:pre_project/myDrawer.dart';
import 'package:pre_project/pradeep/Constants.dart';
import 'package:pre_project/vartul/explore/BuildSearchBar.dart';

class Home extends StatefulWidget {
  static const id = "Home";

  @override
  _HomeState createState() => _HomeState();
}

//comment
class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<double> get _height => Future<double>.value(900);
  BuildSearchBar searchBar = BuildSearchBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      drawer: MyDrawer(),
      key: _scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 30.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
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
                          color: Colors.green,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 85),
              child: FutureBuilder<double>(
                  future: _height,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return AnimatedContainer(
                      decoration: BoxDecoration(
                        color: Color(0xFFEDFDEC),
                      ),
                      height: snapshot.data,
                      duration: Duration(seconds: 4),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            productCategoryList(
                                height: 70,
                                width: 60,
                                data: Constants.categoryData,
                                wide: false),
                            Constants.categoryButton(
                                category: 'Featured Products',
                                context: context),
                            Constants.productCard(),
                            Constants.categoryButton(
                                category: 'Recommended Products',
                                context: context),
                            Constants.productCard(),
                            Constants.productCard(),
                            Constants.categoryButton(
                                category: 'Popular in Your Area',
                                context: context),
                            Constants.productCard(),
                            Constants.categoryButton(
                                category: 'For You', context: context),
                            Constants.productCard(),
                            Constants.categoryButton(
                                category: 'Top in Vegetables',
                                context: context),
                            Constants.productCard(),
                            Center(
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    side: BorderSide(
                                      color: Colors.green,
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
                    );
                  }),
            ),
          ],
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
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => Card(
          // color: Color(0xFFFFFCD1),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: width,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 48,
                      width: 56,
                      child: Image.network(
                        data[index][0],
                        fit: BoxFit.contain,
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
      ),
    );
  }
}
