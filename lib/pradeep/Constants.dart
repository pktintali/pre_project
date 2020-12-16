import 'package:flutter/material.dart';

class Constants {
  static final List<List<String>> products = [
    [
      'https://www.freepnglogos.com/uploads/tomato-png/tomato-and-kidney-stone-everyday-life-23.png',
      'Best Tomato',
      '₹27/kg'
    ],
    [
      'https://www.tajamarket.com/wp-content/uploads/2019/07/dhudhi.png',
      'Lauki',
      '₹10/kg'
    ],
    [
      'http://clipart-library.com/image_gallery2/Onion-PNG-Picture.png',
      'Onion',
      '₹40/kg'
    ],
    [
      'http://www.pngall.com/wp-content/uploads/2016/04/Potato-Free-Download-PNG.png',
      'Potato',
      '₹30/kg'
    ],
    [
      'https://pngimg.com/uploads/carrot/carrot_PNG4985.png',
      'Fresh Carrot',
      '₹15/kg'
    ],
    [
      'https://www.freepnglogos.com/uploads/corn-png/corn-only-organic-2.png',
      'Corn',
      '₹30/unit'
    ],
    [
      'https://www.freepnglogos.com/uploads/tomato-png/tomato-and-kidney-stone-everyday-life-23.png',
      'Best Tomato',
      '₹27/kg'
    ],
    [
      'https://www.tajamarket.com/wp-content/uploads/2019/07/dhudhi.png',
      'Lauki',
      '₹10/kg'
    ],
    [
      'http://clipart-library.com/image_gallery2/Onion-PNG-Picture.png',
      'Onion',
      '₹40/kg'
    ],
    [
      'http://www.pngall.com/wp-content/uploads/2016/04/Potato-Free-Download-PNG.png',
      'Potato',
      '₹30/kg'
    ],
    [
      'https://pngimg.com/uploads/carrot/carrot_PNG4985.png',
      'Fresh Carrot',
      '₹15/kg'
    ],
    [
      'https://www.freepnglogos.com/uploads/corn-png/corn-only-organic-2.png',
      'Corn',
      '₹30/pec'
    ],
  ];

  static Widget categoryButton({@required String category}) {
    return FlatButton(
      onPressed: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ViewAll(
        //               future: future,
        //             )));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(category),
          ),
          Icon(
            Icons.arrow_forward,
            color: Color(0xFF5600E8),
          ),
        ],
      ),
    );
  }

  static IconData myIcons(int i) {
    switch (i) {
      case 1:
        return Icons.badge;
        break;
      case 2:
        return Icons.category;
        break;
      case 3:
        return Icons.favorite;
        break;
      case 4:
        return Icons.add_box;
        break;
      case 5:
        return Icons.train;
        break;
      case 6:
        return Icons.traffic;
        break;
      case 7:
        return Icons.add_alert_sharp;
        break;
      case 8:
        return Icons.badge;
        break;
      default:
        return Icons.account_circle_rounded;
    }
  }
}
