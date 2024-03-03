// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:hurry_project/core/domain/model/model.dart';
import 'package:hurry_project/core/domain/model/response_model/resours_busline_model.dart';

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

  factory ResoursBusLineModel.fromJson(String source) =>
      ResoursBusLineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResoursBusLineModel(id: $id, name: $name, price: $price, city_name: $city_name)';
  }

  @override
  bool operator ==(covariant ResoursBusLineModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.price == price &&
        other.city_name == city_name;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ price.hashCode ^ city_name.hashCode;
  }
}

class PostBuslineModel extends Model {
  String name;
  int price;
  String city_name;
  List<BusLineModel> bus_line;
  PostBuslineModel({
    required this.name,
    required this.price,
    required this.city_name,
    required this.bus_line,
  });

  PostBuslineModel copyWith({
    String? name,
    int? price,
    String? city_name,
    List<BusLineModel>? bus_line,
  }) {
    return PostBuslineModel(
      name: name ?? this.name,
      price: price ?? this.price,
      city_name: city_name ?? this.city_name,
      bus_line: bus_line ?? this.bus_line,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'city_name': city_name,
      'bus_line': bus_line.map((x) => x.toMap()).toList(),
    };
  }

  factory PostBuslineModel.fromMap(Map<String, dynamic> map) {
    return PostBuslineModel(
      name: map['name'] as String,
      price: map['price'] as int,
      city_name: map['city_name'] as String,
      bus_line: List<BusLineModel>.from((map['bus_line'] as List<int>).map<BusLineModel>((x) => BusLineModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostBuslineModel.fromJson(String source) => PostBuslineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostBuslineModel(name: $name, price: $price, city_name: $city_name, bus_line: $bus_line)';
  }

  @override
  bool operator ==(covariant PostBuslineModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.price == price &&
      other.city_name == city_name &&
      listEquals(other.bus_line, bus_line);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      city_name.hashCode ^
      bus_line.hashCode;
  }
}
