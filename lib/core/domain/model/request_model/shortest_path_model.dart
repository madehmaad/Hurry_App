// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hurry_project/core/domain/model/model.dart';

class ShortestPathModel extends Model {
  int source_id;
  int target_id;

  ShortestPathModel({
    required this.source_id,
    required this.target_id,
  });

  

  ShortestPathModel copyWith({
    int? source_id,
    int? target_id,
  }) {
    return ShortestPathModel(
      source_id: source_id ?? this.source_id,
      target_id: target_id ?? this.target_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source_id': source_id,
      'target_id': target_id,
    };
  }

  factory ShortestPathModel.fromMap(Map<String, dynamic> map) {
    return ShortestPathModel(
      source_id: map['source_id'] as int,
      target_id: map['target_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortestPathModel.fromJson(String source) => ShortestPathModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShortestPathModel(source_id: $source_id, target_id: $target_id)';

  @override
  bool operator ==(covariant ShortestPathModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.source_id == source_id &&
      other.target_id == target_id;
  }

  @override
  int get hashCode => source_id.hashCode ^ target_id.hashCode;
}
