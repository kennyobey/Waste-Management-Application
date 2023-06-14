// To parse this JSON data, do
//
//     final collectorListModel = collectorListModelFromJson(jsonString);

import 'dart:convert';

CollectorListModel collectorListModelFromJson(String str) => CollectorListModel.fromJson(json.decode(str));

String collectorListModelToJson(CollectorListModel data) => json.encode(data.toJson());

class CollectorListModel {
    String status;
    String message;
    List<Result> result;

    CollectorListModel({
        required this.status,
        required this.message,
        required this.result,
    });

    factory CollectorListModel.fromJson(Map<String, dynamic> json) => CollectorListModel(
        status: json["status"],
        message: json["message"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    String id;
    String firstName;
    String lastName;
    String profileImageUrl;
    String profileImageSecureUrl;
    String imagePublicId;
    String address;
    String phone;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Result({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.profileImageUrl,
        required this.profileImageSecureUrl,
        required this.imagePublicId,
        required this.address,
        required this.phone,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profileImageUrl: json["profile_image_url"],
        profileImageSecureUrl: json["profile_image_secure_url"],
        imagePublicId: json["image_public_id"],
        address: json["address"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "profile_image_url": profileImageUrl,
        "profile_image_secure_url": profileImageSecureUrl,
        "image_public_id": imagePublicId,
        "address": address,
        "phone": phone,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
