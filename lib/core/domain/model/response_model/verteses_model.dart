// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hurry_project/core/domain/model/model.dart';

class vertesesModel extends Model {
  int id;
  String name;
  int bus_line_id;
  bool is_busy;
  vertesesModel({
    required this.id,
    required this.name,
    required this.bus_line_id,
    required this.is_busy,
  });

  vertesesModel copyWith({
    int? id,
    String? name,
    int? bus_line_id,
    bool? is_busy,
  }) {
    return vertesesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      bus_line_id: bus_line_id ?? this.bus_line_id,
      is_busy: is_busy ?? this.is_busy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'bus_line_id': bus_line_id,
      'is_busy': is_busy,
    };
  }

  factory vertesesModel.fromMap(Map<String, dynamic> map) {
    return vertesesModel(
      id: map['id'] as int,
      name: map['name'] as String,
      bus_line_id: map['bus_line_id'] as int,
      is_busy: map['is_busy'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory vertesesModel.fromJson(String source) =>
      vertesesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'vertesesModel(id: $id, name: $name, bus_line_id: $bus_line_id, is_busy: $is_busy)';
  }

  @override
  bool operator ==(covariant vertesesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.bus_line_id == bus_line_id &&
      other.is_busy == is_busy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      bus_line_id.hashCode ^
      is_busy.hashCode;
  }
}
