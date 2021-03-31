import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyBottomSheet extends StatelessWidget {
  final String number;
  final GeoPoint gp;
  const MyBottomSheet({Key key, this.number, this.gp}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _callAction(String number) async {
      final url = 'tel:+91$number';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _directionAction({String latitude, String longitude}) async {
      final url = "geo:$latitude,$longitude?q=$latitude,$longitude(shop)";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return FractionalTranslation(
      translation: Offset(0, 0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.lightGreenAccent,
                ),
              ),
              onPressed: () {
                _callAction(number);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Call Seller',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Colors.yellow,
              )),
              onPressed: () {
                _directionAction(
                  latitude: gp.latitude.toString() ?? 'NAN',
                  longitude: gp.longitude.toString() ?? 'NAN',
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Directions',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
