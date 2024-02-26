// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hurry_project/core/domain/model/model.dart';

class TokenModel extends Model {
  String token;
  TokenModel({
    required this.token,
  });

  TokenModel copyWith({
    String? token,
  }) {
    return TokenModel(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) => TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TokenModel(token: $token)';

  @override
  bool operator ==(covariant TokenModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
