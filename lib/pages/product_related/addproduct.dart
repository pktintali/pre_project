import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pre_project/Providers/pradeep/current_product.dart';
import 'package:pre_project/firebase/firebase.dart';
import 'package:pre_project/index.dart';
import 'package:pre_project/utils/image_compresser.dart';
import 'package:pre_project/utils/platform_checker.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  static const routename = '/addProduct';
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File _image;
  String _name;
  int _price;
  String _explainPrice;
  String _quantity;
  String _discount;
  String _category;
  String _brand;
  String _description;
  List<dynamic> _tags;
  GeoPoint vGeo;
  List<String> _imageURLS = [];
  final picker = ImagePicker();
  List<Widget> _images = [];
  Future getImage({bool fromCamera}) async {
    final pickedFile = await picker.getImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery);

    if (pickedFile != null) {
      print("Path Is " + pickedFile.path);
      File _tempImage = await Compresser.testCompressAndGetFile(
          File(pickedFile.path),
          '/data/user/0/com.tdevelopers.dsc_noticeboard/cache/compressed' +
              DateTime.now().toString() +
              '.jpg');
      // _image = File(pickedFile.path);
      _image = _tempImage;
      print(_image);
      _images.add(SizedBox(
        child: Image.file(_image),
        height: 120,
        width: 120,
      ));
      setState(() {});
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add a Product",
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
            //fontSize: 20.0,
            //fontFamily: 'MarckScript',
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: Consumer<CurrentProduct>(builder: (context, data, __) {
        return SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Consumer<UserData>(
                builder: (context, userData, __) {
                  if (userData.user != null) {
                    if (userData.user.isVendor) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                          ),
                          Padding(padding: EdgeInsets.all(2.0)),
                          Text(
                            "Enter the Details of Product",
                            style:
                                TextStyle(fontSize: 22.0, color: Colors.black),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12)),
                          Card(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: ' Product Name *',
                                hintText: ' Product Name',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (v) {
                                _name = v;
                              },
                            ),
                          ),
                          Card(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: ' Price *',
                                hintText: ' Price',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (v) {
                                _price = int.parse(v);
                              },
                            ),
                          ),
                          Card(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: ' Explain Price *',
                                hintText: ' Explain Price',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (v) {
                                _explainPrice = v;
                              },
                            ),
                          ),
                          Card(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: ' Quantity *',
                                hintText: ' Quantity',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (v) {
                                _quantity = v;
                              },
                            ),
                          ),
                          Card(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: ' Discount (if any)',
                                hintText: ' Discount',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (v) {
                                _discount = v;
                              },
                            ),
                          ),
                          // Card(
                          //   child: TextField(
                          //     decoration: InputDecoration(
                          //       labelText: ' Category ',
                          //       hintText: ' Category',
                          //       border: OutlineInputBorder(),
                          //     ),
                          //     onChanged: (v) {
                          //       _category = v;
                          //     },
                          //   ),
                          // ),
                          myCategoryInput(),
                          Card(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: ' Brand ',
                                hintText: ' Brand',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (v) {
                                _brand = v;
                              },
                            ),
                          ),
                          Card(
                            child: TextField(
                              textAlign: TextAlign.start,
                              autocorrect: true,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Description *',
                                hintText: ' Describe your Product',
                              ),
                              onChanged: (v) {
                                _description = v;
                              },
                            ),
                          ),
                          Card(
                            child: TextField(
                              textAlign: TextAlign.start,
                              autocorrect: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: ' Tags',
                                hintText: ' Enter Tags Seperated by ,',
                              ),
                              onChanged: (v) {
                                _tags.add(v);
                              },
                            ),
                          ),
                          _images.length > 0
                              ? Wrap(children: _images)
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: !data.uploading
                                ? OutlinedButton(
                                    onPressed: () {
                                      Scaffold.of(context).showBottomSheet(
                                          (context) => bottumSheet(data));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.photo_camera_rounded,
                                            size: 25.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0,
                                            ),
                                          ),
                                          Text(
                                            ' Add photos of your product',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                        ],
                                      ),
                                    ))
                                : SizedBox(),
                          ),
                          data.uploading
                              ? Column(
                                  children: [
                                    Center(child: Text('Uploading')),
                                    SizedBox(height: 8),
                                    LinearProgressIndicator(),
                                    SizedBox(height: 6),
                                  ],
                                )
                              : SizedBox(),
                          Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                          !data.uploading
                              ? ElevatedButton(
                                  child: Text(
                                    'Post this Product for sale',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await FirebaseWork().addProduct(
                                      brand: _brand,
                                      name: _name,
                                      category: _category,
                                      price: _price,
                                      description: _description,
                                      discount: _discount,
                                      quantity: _quantity,
                                      explainPrice: _explainPrice,
                                      tags: _tags,
                                      imageURLS: _imageURLS,
                                      location: userData.user.address,
                                      vendorGeo: userData.user.geoPoint,
                                      vendor: userData.user.email,
                                      vendorName: userData.user.name,
                                      phones: userData.user.phones,
                                    );
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.yellow),
                                    elevation: MaterialStateProperty.all(2.0),
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.lightGreen),
                                  ),
                                )
                              : SizedBox(),
                          Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                        ],
                      );
                    } else {
                      return Text('You are not a vendor');
                    }
                  } else {
                    return Text('You need To Logged In');
                  }
                },
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget myCategoryInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(
        itemHeight: 60,
        hint: Text('Select a Category'),
        isExpanded: true,
        value: _category,
        onChanged: (v) {
          _category = v;
          print(v);
          setState(() {});
        },
        items: [
          DropdownMenuItem(
            child: Text('Vegetables'),
            value: 'Vegetables',
            onTap: () {},
          ),
          DropdownMenuItem(
            child: Text('Fruits'),
            value: 'Fruits',
            onTap: () {},
          ),
          DropdownMenuItem(
            child: Text('Household'),
            value: 'Household',
            onTap: () {},
          ),
          DropdownMenuItem(
            child: Text('Drinks'),
            value: 'Drinks',
            onTap: () {},
          ),
          DropdownMenuItem(
            child: Text('Dry Fruits'),
            value: 'Dry Fruits',
            onTap: () {},
          ),
          DropdownMenuItem(
            child: Text('Others'),
            value: 'Others',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget bottumSheet(CurrentProduct data) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Center(
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
          ),
        ),
        !PlatformCheck.isDesktop(context)
            ? Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        data.toogleUploading();
                        await getImage(fromCamera: true);
                        Navigator.pop(context);
                        String s = await FirebaseWork().uploadFile(_image);
                        _imageURLS.add(s);
                        data.toogleUploading();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Camera', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.lightGreenAccent.shade100),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        data.toogleUploading();
                        await getImage(fromCamera: false);
                        Navigator.pop(context);
                        String s = await FirebaseWork().uploadFile(_image);
                        _imageURLS.add(s);
                        data.toogleUploading();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image, color: Colors.purple),
                            SizedBox(width: 8),
                            Text('Gallery',
                                style: TextStyle(color: Colors.purple)),
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.yellowAccent.shade100),
                      ),
                    ),
                  ),
                ],
              )
            : Text('Image Not Supported on Web and Desktop'),
      ],
    );
  }
}
