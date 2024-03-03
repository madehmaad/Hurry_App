// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hurry_project/core/domain/model/model.dart';



class BusLineModel {
  String name;
  double latitude;
  double longitude;
  BusLineModel({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  BusLineModel copyWith({
    String? name,
    double? latitude,
    double? longitude,
  }) {
    return BusLineModel(
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory BusLineModel.fromMap(Map<String, dynamic> map) {
    return BusLineModel(
      name: map['name'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusLineModel.fromJson(String source) =>
      BusLineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BusLineModel(name: $name, latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant BusLineModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => name.hashCode ^ latitude.hashCode ^ longitude.hashCode;
}

