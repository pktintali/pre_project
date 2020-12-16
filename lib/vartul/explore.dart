import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Explore extends StatefulWidget {
  @override
  _Explore createState() => _Explore();
}

class _Explore extends State<Explore> {
  static final CameraPosition _initPos =
      CameraPosition(target: LatLng(27.2046, 77.4977), zoom: 10.0);

  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntrl) {
    _controller = _cntrl;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(l.latitude, l.longitude),
            zoom: 10.0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: new Stack(children: <Widget>[
          Container(
            child: GoogleMap(
              initialCameraPosition: _initPos,
              mapType: MapType.terrain,
              onMapCreated: _onMapCreated,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
            ),
          ),
          FloatingSearchBar(
            hint: 'Search...',
            scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
            transitionDuration: const Duration(milliseconds: 800),
            transitionCurve: Curves.easeInOut,
            physics: const BouncingScrollPhysics(),
            openAxisAlignment: 0.0,
            debounceDelay: const Duration(milliseconds: 500),
            onQueryChanged: (query) {
              // Call your model, bloc, controller here.
            },
            // Specify a custom transition to be used for
            // animating between opened and closed stated.
            transition: CircularFloatingSearchBarTransition(),
            actions: [
              FloatingSearchBarAction(
                showIfOpened: false,
                child: CircularButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
              FloatingSearchBarAction.searchToClear(
                showIfClosed: false,
              ),
            ],
            builder: (context, transition) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  // child: Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: Colors.accents.map((color) {
                  //     return Container(height: 112, color: color);
                  //   }).toList(),
                  // ),
                ),
              );
            },
          ),
          Container(
              child: Padding(
                  padding: const EdgeInsets.all(100),
                  child: IconButton(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 40,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return Container(
                            color: Color(0xFF737373),
                            child: Container(
                              child: BottomModal(),
                              height: 350,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(10),
                                    topRight: const Radius.circular(10),
                                  )),
                            ),
                          );
                        },
                      );
                    },
                  ))),

        ]),
      ),
    );
  }
  double rating = 3.0;
  changeText(double rate){
    setState(() {
      rating = rate;
    });
  }
  Column BottomModal() {


    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(

            children: [

              Container(
                height: 150,
                child: Card(

                  child: Image(
                    image: AssetImage('assets/shop1.png'),
                  //  fit: BoxFit.fill,
                  )
                ),
              ),

              Container(
                height: 150,
                child: Card(

                    child: Image(
                      image: AssetImage('assets/shop2.png'),
                    //  fit: BoxFit.fill,
                    )
                ),
              ),
              Container(
                height: 150,
                child: Card(

                    child: Image(
                      image: AssetImage('assets/shop3.png'),
                    //  fit: BoxFit.fill,
                    )
                ),
              ),
              Container(
                height: 150,
                child: Card(

                    child: Image(
                      image: AssetImage('assets/shop4.png'),
                    //  fit: BoxFit.fill,
                    )
                ),
              ),
            ],
          ),
        ),

        //  SizedBox(height: 12.0),

        Container(
          margin: new EdgeInsets.only(top: 20,left: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Store Name',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              // SizedBox(height: 6.0),

              Row(
                children: [
                  Text(
                    '$rating',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(width: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RatingBar.builder(
                      initialRating: 3,
                      itemCount: 5,
                      // ignore: missing_return
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                        }
                      },
                      onRatingUpdate: (rating) {
                        print(rating);
                        changeText(rating);
                      },
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'General Store',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Open Close Time',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: new EdgeInsets.only(left: 10),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.directions,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Directions",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_outline_sharp,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: RaisedButton(
                      child: Row(
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Share",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
