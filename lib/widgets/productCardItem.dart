import 'package:flutter/material.dart';
import 'package:pre_project/data/Product.dart';
import 'package:pre_project/index.dart';
import 'package:pre_project/utils/platform_checker.dart';
import 'package:pre_project/widgets/rating_icon.dart';
import 'package:provider/provider.dart';

class ProductCardItem extends StatelessWidget {
  final Product product;
  final bool fromFull;
  const ProductCardItem(
      {Key key,
      this.product,
      this.fromFull = false,
     })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _mdqh = MediaQuery.of(context).size.height;
    double _mdqw = MediaQuery.of(context).size.width;
    return Consumer<CurrentProduct>(
      builder: (context, data, _) => RawMaterialButton(
        hoverColor: Colors.lightGreenAccent,
        onPressed: () {
          data.addProduct(prod: product);
          print(data.product.name);
          Navigator.pushNamed(context, 'products/${data.product.id}');
        },
        child: Column(
          children: [
            fromFull
                ? Container(
                    height: _mdqh > _mdqw ? _mdqh / 4 : _mdqh / 3,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.network(
                        product.imgURL[0],
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : Container(
                    //Changed 86-->83 while testing on windows
                    height: PlatformCheck.isDesktop(context) ? 120 : 83,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.network(
                        product.imgURL[0],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
            SizedBox(height: 4),
            Center(child: Text(product.name)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('₹ ${product.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )),
                  RatingIcon(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
