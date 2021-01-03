import 'package:flutter/material.dart';
import 'package:pre_project/pradeep/pages/ProductDetails.dart';
import 'package:pre_project/pradeep/pages/SeeAll.dart';

class Constants {
  static Widget categoryButton(
      {@required String category, BuildContext context}) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SeeAll(
                      data: products,
                      type: category,
                    )));
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
            child: Text(
              category,
              style: TextStyle(
                color: Color(0xFF5600E8),
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Color(0xFF5600E8),
            // color: Colors.green,
          ),
        ],
      ),
    );
  }

  //Main Product Card USed for every product
  static Widget productCard() {
    return SizedBox(
      height: 145,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) => Card(
          // color: Color(0xFFFFFCD1),
          child: Container(
            width: 130,
            child: Center(
              child: productCardItem(
                  context: context, product: Constants.products[index]),
            ),
          ),
        ),
      ),
    );
  }

//Item for productcard
  static Widget productCardItem(
      {List<String> product, bool fromFull = false, BuildContext context}) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, ProductDetails.id);
      },
      child: Column(
        children: [
          fromFull
              ? Container(
                  // height: 85,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.network(
                      product[0],
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : Container(
                  //Changed 86-->83 while testing on windows
                  height: 83,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.network(
                      product[0],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
          SizedBox(height: 6),
          Center(child: Text(product[1])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                ),
                Text(product[2])
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget sellerCard() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            Container(
              child: RawMaterialButton(
                onPressed: () {},
                padding: EdgeInsets.all(0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://tekrabuilders.com/wp-content/uploads/2018/12/male-placeholder-image.jpeg'),
                  ),
                ),
              ),
            ),
            Text('Seller X'),
          ],
        ),
      ),
    );
  }

  static Widget usersCardItem(
      {List<String> product, bool fromFull = false, BuildContext context}) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RaisedButton(
        onPressed: () {},
        //elevation: 8.0,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(product[0]),
                ),
              ),
            ),
            Text(
              'Seller X',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  static final List<List<String>> products = [
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png',
      'Product Name',
      '₹X',
      'Rating'
    ],
  ];

  static List<List<String>> categoryData = [
    [
      'https://www.seekpng.com/png/detail/894-8942715_fruits-amp-vegetables-clipart-png-fruit-vegetable-png.png',
      'Fruits'
    ],
    [
      'https://4.imimg.com/data4/WA/BC/IMOB-34484009/c__data_users_defapps_appdata_internetexplorer_temp_sav-500x500.png',
      'Vegetables'
    ],
    [
      'https://4.imimg.com/data4/YI/XR/MY-26823497/branded-mrp-items-500x500.jpg',
      'Drinks'
    ],
    [
      'https://i2-prod.gloucestershirelive.co.uk/incoming/article2388909.ece/ALTERNATES/s615/1_Poundland-Promotion.jpg',
      'Household'
    ],
    [
      'https://5.imimg.com/data5/XU/DX/PV/SELLER-3277670/dry-fruits-500x500.jpg',
      'Dry Fruits'
    ],
    ['https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png', 'Dummy'],
    [
      'https://4.imimg.com/data4/YI/XR/MY-26823497/branded-mrp-items-500x500.jpg',
      'Drinks'
    ],
    [
      'https://4.imimg.com/data4/WA/BC/IMOB-34484009/c__data_users_defapps_appdata_internetexplorer_temp_sav-500x500.png',
      'Vegetables'
    ],
    [
      'https://i2-prod.gloucestershirelive.co.uk/incoming/article2388909.ece/ALTERNATES/s615/1_Poundland-Promotion.jpg',
      'Household'
    ],
    [
      'https://5.imimg.com/data5/XU/DX/PV/SELLER-3277670/dry-fruits-500x500.jpg',
      'Dry Fruits'
    ],
  ];
}
