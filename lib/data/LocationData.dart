import 'dart:convert';

import 'package:geolocator/geolocator.dart';

class LocationData {
  String address;
  Position position;
  bool error;
  LocationData({
    this.address,
    this.position,
    this.error,
  });

  LocationData copyWith({
    String address,
    Position position,
    bool error,
  }) {
    return LocationData(
      address: address ?? this.address,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'position': position,
    };
  }

  factory LocationData.fromMap(Map<String, dynamic> map) {
    return LocationData(
      address: map['address'],
      position: Position.fromMap(map['position']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationData.fromJson(String source) =>
      LocationData.fromMap(json.decode(source));

  @override
  String toString() => 'LocationData(address: $address, position: $position)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationData &&
        other.address == address &&
        other.position == position;
  }

  @override
  int get hashCode => address.hashCode ^ position.hashCode;
}
