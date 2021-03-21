import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class GestureImage extends StatelessWidget {
  final String url;

  const GestureImage({Key key, @required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        // height: 800,
        // width: 600,
        child: ExtendedImage.network(
          url,
          fit: BoxFit.contain,
          //enableLoadState: false,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: (state) {
            return GestureConfig(
              minScale: 0.9,
              animationMinScale: 0.7,
              maxScale: 3.0,
              animationMaxScale: 3.5,
              speed: 1.0,
              inertialSpeed: 100.0,
              initialScale: 1.0,
              inPageView: false,
              initialAlignment: InitialAlignment.center,
              
            );
          },
        ),
      ),
    );
  }
}
