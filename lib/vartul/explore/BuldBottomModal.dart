// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class BuildBottomModal {
//   Column buildBottomModal(BuildContext context) {
//     return Column(
//       children: [
//         //shop images
//         Flexible(fit: FlexFit.loose, flex: 3, child: shopImages()),

//         //  SizedBox(height: 12.0),

//         //rating bar and rest of the text
//         Flexible(fit: FlexFit.loose, flex: 4, child: ratingBar(context)),

//         //required buttons
//         Flexible(fit: FlexFit.loose, flex: 2, child: buttons(context))
//       ],
//     );
//   }

//   SingleChildScrollView shopImages() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           Container(
//             height: 150,
//             child: Card(
//                 child: Image(
//                   image: AssetImage('assets/images/shop1.png'),
//                   //  fit: BoxFit.fill,
//                 )),
//           ),
//           Container(
//             height: 150,
//             child: Card(
//                 child: Image(
//                   image: AssetImage('assets/images/shop2.png'),
//                   //  fit: BoxFit.fill,
//                 )),
//           ),
//           Container(
//             height: 150,
//             child: Card(
//                 child: Image(
//                   image: AssetImage('assets/images/shop3.png'),
//                   //  fit: BoxFit.fill,
//                 )),
//           ),
//           Container(
//             height: 150,
//             child: Card(
//                 child: Image(
//                   image: AssetImage('assets/images/shop4.png'),
//                   //  fit: BoxFit.fill,
//                 )),
//           ),
//         ],
//       ),
//     );
//   }

//   Container ratingBar(BuildContext context) {
//     return Container(
//       margin: new EdgeInsets.only(
//           top: MediaQuery.of(context).size.height * 0.01,
//           left: MediaQuery.of(context).size.height * 0.02,
//           bottom: MediaQuery.of(context).size.height * 0.02),
//       child: Column(
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Store Name',
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * 0.05,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           // SizedBox(height: 6.0),

//           Container(
//             height: MediaQuery.of(context).size.height * 0.06,
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: RatingBar.builder(
//                 initialRating: 3,
//                 itemCount: 5,
//                 // ignore: missing_return
//                 itemBuilder: (context, index) {
//                   switch (index) {
//                     case 0:
//                       return Icon(
//                         Icons.sentiment_very_dissatisfied,
//                         color: Colors.red,
//                       );
//                     case 1:
//                       return Icon(
//                         Icons.sentiment_dissatisfied,
//                         color: Colors.redAccent,
//                       );
//                     case 2:
//                       return Icon(
//                         Icons.sentiment_neutral,
//                         color: Colors.amber,
//                       );
//                     case 3:
//                       return Icon(
//                         Icons.sentiment_satisfied,
//                         color: Colors.lightGreen,
//                       );
//                     case 4:
//                       return Icon(
//                         Icons.sentiment_very_satisfied,
//                         color: Colors.green,
//                       );
//                   }
//                 },
//                 onRatingUpdate: (rating) {
//                   print(rating);
//                 },
//               ),
//             ),
//           ),

//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Store Type',
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * 0.04,
//                   color: Colors.black),
//             ),
//           ),

//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Open Close Time',
//               style: TextStyle(
//                   fontSize: MediaQuery.of(context).size.height * 0.04,
//                   color: Colors.black),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container buttons(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(4),
//       child: Row(

//         children: [
//           Expanded(
//             flex: 4,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               height: MediaQuery.of(context).size.height * 0.07,
//               margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
//               child: RaisedButton(
//                 child: Row(
//                   //mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(
//                       Icons.directions,
//                       color: Colors.white,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.01,
//                     ),
//                     Text(
//                       "Directions",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 color: Colors.blue,
//                 onPressed: () {
//                   print('DIRECTION');
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               height: MediaQuery.of(context).size.height * 0.07,
//               margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
//               child: RaisedButton(
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.call,
//                       color: Colors.blue,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.0,
//                     ),
//                     Text(
//                       "Call",
//                       style: TextStyle(
//                         color: Colors.black45,
//                       ),
//                     ),
//                   ],
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 color: Colors.white,
//                 onPressed: () {
//                   print('SAVE');
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               height: MediaQuery.of(context).size.height * 0.07,
//               margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
//               child: RaisedButton(
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.share_outlined,
//                       color: Colors.blue,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*0.01,
//                     ),
//                     Text(
//                       "Share",
//                       style: TextStyle(
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ],
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 color: Colors.white,
//                 onPressed: () {
//                   print('SHARE');
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
