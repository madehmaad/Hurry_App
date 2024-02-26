// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hurry_project/core/domain/model/model.dart';

class RegisterModel extends Model {
  String name;
  String email;
  String password;
  String gender;
  String birth;
  String phone;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.birth,
    required this.phone,
  });

 

  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    String? gender,
    String? birth,
    String? phone,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      birth: birth ?? this.birth,
      phone: phone ?? this.phone,
    );
  }

   toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'birth': birth,
      'phone': phone,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      gender: map['gender'] as String,
      birth: map['birth'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(name: $name, email: $email, password: $password, gender: $gender, birth: $birth, phone: $phone)';
  }

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.gender == gender &&
      other.birth == birth &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      gender.hashCode ^
      birth.hashCode ^
      phone.hashCode;
  }
}
