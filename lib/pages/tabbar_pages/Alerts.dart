import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Alerts extends StatelessWidget {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    print('Completed');
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alerts'),
        centerTitle: true,
        // leading: Container(),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropMaterialHeader(),
        // footer: CustomFooter(
        //   builder: (BuildContext context, LoadStatus mode) {
        //     Widget body;
        //     if (mode == LoadStatus.idle) {
        //       body = Text("pull up load");
        //     } else if (mode == LoadStatus.loading) {
        //       body = CupertinoActivityIndicator(radius: 15);
        //     } else if (mode == LoadStatus.failed) {
        //       body = Text("Load Failed!Click retry!");
        //     } else if (mode == LoadStatus.canLoading) {
        //       body = Text("release to load more");
        //     } else {
        //       body = Text("No more Data");
        //     }
        //     return Container(
        //       height: 55.0,
        //       child: Center(child: body),
        //     );
        //   },
        // ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return index == 19 ? SizedBox(height: 30) : alerTtile();
          },
        ),
      ),
    );
  }

  Widget alerTtile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('23 Dec'),
            // Icon(Icons.star_outline),
          ],
        ),
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              'D',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
        title: Text('Demo Notification'),
        subtitle: Text('This is example demo notification description'),
        // tileColor: Colors.lightGreenAccent,
        onTap: () {},
      ),
    );
  }
}
