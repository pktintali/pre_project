import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pre_project/pradeep/Constants.dart';

class CategoryView extends StatefulWidget {
  final String type;
  final String imgUrl;
  CategoryView({this.type, this.imgUrl});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFEDFDEC),
      backgroundColor: Colors.green,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.green,
                expandedHeight: 180.0,
                floating: false,
                pinned: true,
                stretch: true,
                // snap: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      widget.type,
                      style: TextStyle(shadows: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1.0,
                          blurRadius: 1.5,
                        )
                      ]),
                    ),
                    background: Hero(
                      tag: widget.type + widget.imgUrl,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.8), BlendMode.dstATop),
                          image: NetworkImage(
                            widget.imgUrl,
                          ),
                        )),
                      ),
                    )),
              )
            ];
          },
          body: Container(
            color: Color(0xFFEDFDEC),
            child: productList(context: context),
          ),
        ),
      ),
    );
  }

  Widget productList({BuildContext context}) {
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(0),
        crossAxisCount: (orientation == Orientation.portrait) ? 2 : 4,
        itemCount: 11,
        physics: BouncingScrollPhysics(),
        // crossAxisSpacing: 20,
        // mainAxisSpacing: 20,
        staggeredTileBuilder: (index) => StaggeredTile.fit(index != 0
            ? 1
            : (orientation == Orientation.portrait)
                ? 2
                : 4),
        itemBuilder: (BuildContext context, int index) => index == 0
            ? Container(
                color: Color(0xFFEDFDEC),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Top ${widget.type} sellers'),
                    SizedBox(height: 10),
                    Constants.sellerCard(),
                  ],
                ),
              )
            : Card(
                child: Container(
                  width: 130,
                  child: Center(
                    child: Constants.productCardItem(
                      context: context,
                      fromFull: true,
                      product: Constants.products[index],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
