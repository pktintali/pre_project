import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //  Padding(
              //   padding: const EdgeInsets.all(3.0),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       suffixIcon: IconButton(
              //         color: Colors.green,
              //         icon: Icon(Icons.search),
              //         onPressed: () {},
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(100),
              //         ),
              //       ),
              //       hintText: 'Search any product/shop...',
              //     ),
              //     autocorrect: true,
              //     onChanged: (v) {},
              //      decoration: TextDecoration(),
              //   ),
              // ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.green,
                //color: Colors.lightGreenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Featured Products'),
                ),
              ),
              productCard(
                img:
                    'https://images-na.ssl-images-amazon.com/images/I/61yXL70-RaL._SX679_.jpg',
                name: 'Best Quality Potato',
                price: '₹199',
              ),
              productCard(
                img:
                    'https://navbharattimes.indiatimes.com/photo.cms?photoid=70153751',
                name: 'Best Quality Tomato',
                price: '₹139',
              ),
              productCard(
                img: 'https://kj2bcdn.b-cdn.net/media/6766/muli.jpg',
                name: 'Best Radish',
                price: '₹101',
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Recomended Products'),
                ),
              ),
              Card(
                elevation: 2.0,
                shadowColor: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Populer Products'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productCard({String img = '', String name = '', String price = ''}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: Image.network(
                        img,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          price,
                          //'₹199',
                          style: TextStyle(
                            fontSize: 18,
                            //color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Place :     '),
                            Text(
                              'Bahuara Gate',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Seller :     '),
                            Text(
                              'Ramu Kaka',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    color: Colors.lightGreenAccent,
                    onPressed: () {},
                    child: Text('Call Seller'),
                  ),
                  FlatButton(
                    color: Colors.yellow,
                    onPressed: () {},
                    child: Text('Directions'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
