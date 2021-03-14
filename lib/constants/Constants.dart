import 'package:flutter/material.dart';
import 'package:pre_project/data/Product.dart';
import 'package:pre_project/pages/ProductDetails.dart';
import 'package:pre_project/pages/SeeAll.dart';

class Constants {
  static Widget categoryButton(
      {@required String category, BuildContext context}) {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SeeAll(
                      data: products,
                      type: category,
                    )));
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
        overlayColor: MaterialStateProperty.all(Colors.yellowAccent),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
      ),
    );
  }

  //Main Product Card USed for every product
  static Widget productCard({@required List<Product> product}) {
    return SizedBox(
      height: 145,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (BuildContext context, int index) => Card(
          // color: Color(0xFFFFFCD1),
          child: Container(
            width: 130,
            child: Center(
              child: productCardItem(
                  context: context, product: product[index]),
            ),
          ),
        ),
      ),
    );
  }

//Item for productcard
  static Widget productCardItem(
      {Product product, bool fromFull = false, BuildContext context}) {
    return RawMaterialButton(
      hoverColor: Colors.lightGreenAccent,
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
                      product.imgURL[0],
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
                Text('${product.price}'),
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
        itemCount: 15,
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
                        'https://avatars.services.sap.com/images/jolanta.gniadek_small.png'),
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
      child: OutlinedButton(
        onPressed: () {},
        //elevation: 8.0,
        // color: Colors.white,
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
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Product Name',
      '₹X',
      'Rating'
    ],
  ];

  static List<List<String>> categoryData = [
    [
      'https://img.pngio.com/fruit-basket-png-png-collections-at-sccprecat-fruit-basket-png-800_800.png',
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
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy1'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy2'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy3'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy4'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy5'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy6'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy7'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy8'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy9'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy10'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy11'
    ],
    [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM8oE5gpw4fs_EdFLXESrR88AOx4y6a2SawQ&usqp=CAU',
      'Dummy12'
    ],
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
