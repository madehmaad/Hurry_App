import 'dart:convert';

import 'package:hurry_project/core/domain/model/model.dart';

class ShortestPathModel extends Model {
  String sourceName;
  String targetName;

  ShortestPathModel({
    required this.sourceName,
    required this.targetName,
  });

  ShortestPathModel copyWith({
    String? sourceName,
    String? targetName,
  }) =>
      ShortestPathModel(
        sourceName: sourceName ?? this.sourceName,
        targetName: targetName ?? this.targetName,
      );

  factory ShortestPathModel.fromJson(String str) =>
      ShortestPathModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShortestPathModel.fromMap(Map<String, dynamic> json) =>
      ShortestPathModel(
        sourceName: json["source_name"],
        targetName: json["target_name"],
      );

  Map<String, dynamic> toMap() => {
        "source_name": sourceName,
        "target_name": targetName,
      };
}