import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String description;
  final String id;
  final int price;
  final String vendor;
  final String tags;
  final List<dynamic> imgURL;
  final Timestamp timeStamp;
  final String vendorLocation;
  final String phone;
  Product({
    this.name,
    this.description,
    this.id,
    this.price,
    this.vendor,
    this.tags,
    this.imgURL,
    this.timeStamp,
    this.vendorLocation,
    this.phone,
  });

  Product copyWith({
    String name,
    String description,
    String id,
    int price,
    String vendor,
    String tags,
    List<String> imgURL,
    Timestamp timeStamp,
    String phone,
  }) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      id: id ?? this.id,
      price: price ?? this.price,
      vendor: vendor ?? this.vendor,
      tags: tags ?? this.tags,
      imgURL: imgURL ?? this.imgURL,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'id': id,
      'price': price,
      'vendor': vendor,
      'tags': tags,
      'imgURL': imgURL,
      'timeStamp': timeStamp,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      name: map['name'],
      description: map['description'],
      id: map['id'],
      price: map['price'],
      vendor: map['vendor'],
      tags: map['tags'],
      imgURL: List<String>.from(map['imgURL']),
      timeStamp: map['timeStamp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(name: $name, description: $description, id: $id, price: $price, vendor: $vendor, tags: $tags, imgURL: $imgURL, timeStamp: $timeStamp)';
  }
}
