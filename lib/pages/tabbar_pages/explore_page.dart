import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pre_project/pages/app_pages/SeeAll2.dart';
import 'package:pre_project/utils/get_location.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
      future: GetLocation.getposition(),
      builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
        return SeeAll2(
          type: 'Near By Products',
          position: snapshot.data,
        );
      },
    );
  }
}
