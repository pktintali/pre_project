import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class MyUser {
  final String name;
  final String email;
  final bool isVendor;
  final String address;
  final String about;
  final GeoPoint geoPoint;
  final bool isUPI;
  final String language;
  final List phones;
  final String userID;
  final String vendorRating;
  final List favs;
  MyUser({
    this.name,
    this.email,
    this.isVendor,
    this.address,
    this.about,
    this.geoPoint,
    this.isUPI,
    this.language,
    this.phones,
    this.userID,
    this.favs,
    this.vendorRating,
  });

  MyUser copyWith({
    String name,
    String email,
    bool isVendor,
    String address,
    String about,
    GeoPoint geoPoint,
    bool isUPI,
    String language,
    List<int> phones,
    String userID,
    String vendorRating,
    List favs,
  }) {
    return MyUser(
      name: name ?? this.name,
      email: email ?? this.email,
      isVendor: isVendor ?? this.isVendor,
      address: address ?? this.address,
      about: about ?? this.about,
      geoPoint: geoPoint ?? this.geoPoint,
      isUPI: isUPI ?? this.isUPI,
      language: language ?? this.language,
      phones: phones ?? this.phones,
      userID: userID ?? this.userID,
      vendorRating: vendorRating ?? this.vendorRating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'isVendor': isVendor,
      'address': address,
      'about': about,
      'isUPI': isUPI,
      'language': language,
      'phones': phones,
      'userID': userID,
      'vendorRating': vendorRating,
    };
  }

  factory MyUser.fromMap(Map<String, dynamic> map) {
    return MyUser(
      name: map['name'],
      email: map['email'],
      isVendor: map['isVendor'],
      address: map['address'],
      about: map['about'],
      isUPI: map['isUPI'],
      language: map['language'],
      phones: List<int>.from(map['phones']),
      userID: map['userID'],
      vendorRating: map['vendorRating'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MyUser.fromJson(String source) => MyUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MyUser(name: $name, email: $email, isVendor: $isVendor, address: $address, about: $about, geoPoint: $geoPoint, isUPI: $isUPI, language: $language, phones: $phones, userID: $userID, vendorRating: $vendorRating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyUser &&
        other.name == name &&
        other.email == email &&
        other.isVendor == isVendor &&
        other.address == address &&
        other.about == about &&
        other.geoPoint == geoPoint &&
        other.isUPI == isUPI &&
        other.language == language &&
        listEquals(other.phones, phones) &&
        other.userID == userID &&
        other.vendorRating == vendorRating;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        isVendor.hashCode ^
        address.hashCode ^
        about.hashCode ^
        geoPoint.hashCode ^
        isUPI.hashCode ^
        language.hashCode ^
        phones.hashCode ^
        userID.hashCode ^
        vendorRating.hashCode;
  }
}
