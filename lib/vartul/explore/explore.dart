import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pre_project/vartul/explore/BuildSearchBar.dart';
import 'package:pre_project/vartul/explore/BuldBottomModal.dart';

class Explore extends StatefulWidget {
  @override
  _Explore createState() => _Explore();
}

//Explore widget is divided into 3 parts :-
//   1. Map => It is coded here itself
//   2. Search Bar => It is coded in the function of class BuildSearchBar. BuildSearchBar object is used to call the function.
//   3. Bottom Modal(pop-up) => It is coded in the function of class BuildBottomModal.
//                             BuildBottomModal object is used to call the function. It pops up when location icon is pressed.
class _Explore extends State<Explore> {
  BuildSearchBar sb = new BuildSearchBar();
  BuildBottomModal bm = new BuildBottomModal();

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
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: new Stack(children: <Widget>[
          //Google map
          Container(
            child: GoogleMap(
              initialCameraPosition: _initPos,
              mapType: MapType.terrain,
              onMapCreated: _onMapCreated,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
            ),
          ),

          //Location icon
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
                              child: bm.buildBottomModal(context),
                              height: MediaQuery.of(context).size.height * 0.8,
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

          sb.buildFloatingSearchBar(),
        ]),
      ),
    );
  }
}
