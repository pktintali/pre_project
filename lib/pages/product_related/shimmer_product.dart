import 'package:flutter/material.dart';
import 'package:pre_project/widgets/shimmer_box.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 55),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Color(0xFFEDFDEC),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      bottomSheet: FractionalTranslation(
        translation: Offset(0, 0),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.lightGreenAccent,
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '',
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
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      //
      appBar: AppBar(
        title: Text('Loading...'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ShimmerBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(height: 25, width: 150),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          children: [
                            ShimmerBox(height: 18, width: 37),
                            SizedBox(width: 5),
                            ShimmerBox(height: 20, width: 100)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.share,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              ShimmerBox(
                  height: 25, width: MediaQuery.of(context).size.width - 20),
              SizedBox(height: 6),
              Divider(),
              SizedBox(height: 6),
              ShimmerBox(
                  height: 10, width: MediaQuery.of(context).size.width - 10),
              SizedBox(height: 6),
              ShimmerBox(
                  height: 10, width: MediaQuery.of(context).size.width - 10),
              SizedBox(height: 6),
              ShimmerBox(
                  height: 10, width: MediaQuery.of(context).size.width - 10),
              SizedBox(height: 6),
              ShimmerBox(
                  height: 10, width: MediaQuery.of(context).size.width - 10),
              SizedBox(height: 6),
              ShimmerBox(
                  height: 10, width: MediaQuery.of(context).size.width - 10),
              SizedBox(height: 6),
              ShimmerBox(
                  height: 10, width: MediaQuery.of(context).size.width - 10),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Sold By:',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 6),
                      ShimmerBox(height: 30, width: 130),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Seller Rating:',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(width: 6),
                      ShimmerBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Location: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      ShimmerBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  Row(
                    children: [
                      Text(
                        'Product Category: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      ShimmerBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text(
                        'Brand: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      ShimmerBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text(
                        'Product Category: ',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      ShimmerBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2),
                    ],
                  ),
                  Divider(),
                ],
              ),
              SizedBox(height: 6),
              Divider(),
              SizedBox(height: 6),
              SizedBox(height: 65),
            ],
          ),
        ),
      ),
    );
  }
}
