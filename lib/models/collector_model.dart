// To parse this JSON data, do
//
//     final collectoModel = collectoModelFromJson(jsonString);

import 'dart:convert';

CollectoModel collectoModelFromJson(String str) =>
    CollectoModel.fromJson(json.decode(str));

String collectoModelToJson(CollectoModel data) => json.encode(data.toJson());

class CollectoModel {
  String? status;
  String? message;
  ColletorData? result;

  CollectoModel({
    this.status,
    this.message,
    this.result,
  });

  factory CollectoModel.fromJson(Map<String, dynamic> json) => CollectoModel(
        status: json["status"],
        message: json["message"],
        result: ColletorData.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result!.toJson(),
      };
}

class ColletorData {
  String? firstName;
  String? lastName;
  String? image;
  String? address;
  String? phone;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  ColletorData({
    this.firstName,
    this.lastName,
    this.image,
    this.address,
    this.phone,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory ColletorData.fromJson(Map<String, dynamic> json) => ColletorData(
        firstName: json["first_name"],
        lastName: json["last_name"],
        image: json["image"],
        address: json["address"],
        phone: json["phone"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "image": image,
        "address": address,
        "phone": phone,
        "_id": id,
      };
}

