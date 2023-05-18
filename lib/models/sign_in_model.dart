// To parse this JSON data, do
//
//     final signIn = signInFromJson(jsonString);

import 'dart:convert';

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

class SignIn {
  String status;
  String message;
  User result;

  SignIn({
    required this.status,
    required this.message,
    required this.result,
  });

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        status: json["status"],
        message: json["message"],
        result: User.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result.toJson(),
      };
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? role;
  String? address;
  String? phone;
  String? password;
  String? confirmPassword;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.role,
    this.address,
    this.phone,
    this.password,
    this.confirmPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] ?? '',
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        role: json["role"] ?? '',
        address: json["address"] ?? '',
        phone: json["phone"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "email": email,
        "role": role,
        "address": address,
        "phone": phone,
        "password": password,
        "confirm_password": confirmPassword,
      };
}
