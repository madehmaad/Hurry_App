// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hurry_project/core/domain/model/model.dart';

class ResoursBusLineModel extends Model {
  int id;
  String name;
  int price;
  String city_name;
 
  ResoursBusLineModel({
    required this.id,
    required this.name,
    required this.price,
    required this.city_name,
  });

  ResoursBusLineModel copyWith({
    int? id,
    String? name,
    int? price,
    String? city_name,
  }) {
    return ResoursBusLineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      city_name: city_name ?? this.city_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'city_name': city_name,
    };
  }

  factory ResoursBusLineModel.fromMap(Map<String, dynamic> map) {
    return ResoursBusLineModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      city_name: map['city_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResoursBusLineModel.fromJson(String source) => ResoursBusLineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResoursBusLineModel(id: $id, name: $name, price: $price, city_name: $city_name)';
  }

  @override
  bool operator ==(covariant ResoursBusLineModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.price == price &&
      other.city_name == city_name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      city_name.hashCode;
  }
}


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

  factory BusLineModel.fromJson(String source) => BusLineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BusLineModel(name: $name, latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant BusLineModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.latitude == latitude &&
      other.longitude == longitude;
  }

  @override
  int get hashCode => name.hashCode ^ latitude.hashCode ^ longitude.hashCode;
}
