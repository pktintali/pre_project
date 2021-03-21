import 'package:flutter/material.dart';

class RatingIcon extends StatelessWidget {
  // final double rating;

  // const RatingIcon({Key key,@required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      height: 18,
      width: 37,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '4.5',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.star,
              size: 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
