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
  String? profileImageUrl;
  String? profileImageSecureUrl;
  String? imagePublicId;
  String? address;
  String? phone;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ColletorData({
    this.firstName,
    this.lastName,
    this.profileImageUrl,
    this.profileImageSecureUrl,
    this.imagePublicId,
    this.address,
    this.phone,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ColletorData.fromJson(Map<String, dynamic> json) => ColletorData(
        firstName: json["first_name"],
        lastName: json["last_name"],
        profileImageUrl: json["profile_image_url"],
        profileImageSecureUrl: json["profile_image_secure_url"],
        imagePublicId: json["image_public_id"],
        address: json["address"],
        phone: json["phone"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "profile_image_url": profileImageUrl,
        "profile_image_secure_url": profileImageSecureUrl,
        "image_public_id": imagePublicId,
        "address": address,
        "phone": phone,
        "_id": id,
      };
}
