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
                    'https://europatat.eu/wp-content/uploads/2016/10/shutterstock_234553048.png',
                name: 'Best Quality Potato',
                price: '₹30/Kg',
              ),
              productCard(
                img: 'https://pngimg.com/uploads/tomato/tomato_PNG12590.png',
                name: 'Fresh Tomato',
                price: '₹50/Kg',
              ),
              productCard(
                img:
                    'https://lh3.googleusercontent.com/proxy/gsjxnlvp-vzsfkwr4AiKX0uPIVKxv0AaHu1J1r0t0uL8MwngLyonsMGl7SM-FIG4vPQJwF-tytDXpuJHOyMfJbsQV1gYHa4Y1erEgqgiF_VKoHJn',
                name: 'Onion',
                price: '₹35/Kg',
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
        elevation: 3.0,
        //shadowColor: Colors.green,
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
              SizedBox(
                height: 5.0,
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
