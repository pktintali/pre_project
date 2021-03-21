import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String description;
  final String id;
  final int price;
  final String category;
  final String vendor;
  final List<dynamic> tags;
  final String vendorName;
  final List<dynamic> imgURL;
  final Timestamp timeStamp;
  final String vendorLocation;
  final GeoPoint vendorGeo;
  final String phone;
  final String explainPrice;
  final String brand;
  final String quantitity;
  final String dicsount;
  Product({
    this.name,
    this.description,
    this.id,
    this.price,
    this.brand,
    this.dicsount,
    this.vendor,
    this.tags,
    this.imgURL,
    this.quantitity,
    this.vendorGeo,
    this.category,
    this.timeStamp,
    this.vendorLocation,
    this.phone,
    this.explainPrice,
    this.vendorName,
  });

  Product copyWith({
    String name,
    String description,
    String id,
    int price,
    String vendor,
    List<String> tags,
    String brand,
    int quantitity,
    String discount,
    GeoPoint vendorGeo,
    List<String> imgURL,
    Timestamp timeStamp,
    String phone,
    String explainPrice,
    String vendorName,
    String category,
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
      explainPrice: explainPrice ?? this.explainPrice,
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
