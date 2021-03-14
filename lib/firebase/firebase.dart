import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseWork {
  CollectionReference users =
      FirebaseFirestore.instance.collection('usersData');
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<void> addUser(
      {@required String name,
      @required String email,
      @required String mobileNo,
      bool isSeller = false}) async {
    // Call the user's CollectionReference to add a new user
    return await users
        .doc('$email')
        .set({
          'name': name,
          'userID': email,
          'phones': [mobileNo],
          'isVendor': isSeller
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future getProducts() {
    return FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                print(doc["id"]);
              })
            });
  }

  Future<void> addProduct(
      {String name,
      int price,
      String explainPrice,
      String quantity,
      String discount,
      String category,
      String brand,
      String description,
      List<String> imageURLS,
      String location,
      String vendor,
      String vendorName,
      String phone,
      String tags}) {
    return products
        .add({
          'name': name ?? '',
          'price': price ?? 0,
          'priceDescription': explainPrice ?? '',
          'quantity': quantity ?? 0,
          'discount': discount ?? '',
          'category': category ?? '',
          'brand': brand ?? '',
          'description': description ?? '',
          'tags': tags,
          'vendorLocation': location ?? '',
          'addedOn': DateTime.now(),
          'imgURLS': imageURLS,
          'vendor': vendor,
          'vendorName': vendorName,
          'phones': phone??'',
        })
        .then((value) => print(value.id))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<String> uploadFile(File f) async {
    File file = f;
    Future<String> downloadURL;
    DateTime d = new DateTime.now();
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('products/${d.toString()}')
          .putFile(file)
          .then((res) => downloadURL = res.ref.getDownloadURL());
      return downloadURL;
    } on firebase_storage.FirebaseException catch (e) {
      print("Error" + e.toString());
      return e.message;
      // e.g, e.code == 'canceled'
    }
  }
}
