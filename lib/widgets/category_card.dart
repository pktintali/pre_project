import 'package:flutter/material.dart';
import 'package:pre_project/widgets/CategoryView.dart';

class CategoryCard extends StatelessWidget {
  final String name, img;
  const CategoryCard({Key key, this.name, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Colors.green),
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        side: MaterialStateProperty.all(
            BorderSide(width: 1.0, color: Colors.green)),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CategoryView(
                      type: name,
                      imgUrl: img,
                    )));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              height: 80,
              child: Hero(tag: name + img, child: Image.network(img)),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 30,
                  color: Colors.green,
                  child: Center(child: Text(name)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
