import 'dart:convert';

import 'package:hurry_project/core/domain/model/model.dart';

class JoinOrderModel extends Model {
  int orderId;
  int numOfPeople;

  JoinOrderModel({
    required this.orderId,
    required this.numOfPeople,
  });

  JoinOrderModel copyWith({
    int? orderId,
    int? numOfPeople,
  }) =>
      JoinOrderModel(
        orderId: orderId ?? this.orderId,
        numOfPeople: numOfPeople ?? this.numOfPeople,
      );

  factory JoinOrderModel.fromJson(String str) =>
      JoinOrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JoinOrderModel.fromMap(Map<String, dynamic> json) => JoinOrderModel(
        orderId: json["order_id"],
        numOfPeople: json["num_of_people"],
      );

  Map<String, dynamic> toMap() => {
        "order_id": orderId,
        "num_of_people": numOfPeople,
      };
}