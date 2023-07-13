// class GetTeamsModel {
//   GetTeamsModel({
//      this.status,
//      this.message,
//      this.result,
//   });
//    String? status;
//    String? message;
//    List<TeamResult>? result;

//   GetTeamsModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     result = List.from(json['result']).map((e)=>TeamResult.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['result'] = result!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class TeamResult {
//   TeamResult({
//      this.id,
//      this.name,
//      this.area,
//      this.leader1,
//      this.leader2,
//      this.member,
//      this.createdAt,
//      this.updatedAt,
//      this.V,
//   });
//     String? id;
//     String? name;
//     String? area;
//     Null? leader1;
//     Null? leader2;
//     List<dynamic>? member;
//     String? createdAt;
//     String? updatedAt;
//     int? V;

//   TeamResult.fromJson(Map<String, dynamic> json){
//     id = json['_id'];
//     name = json['name'];
//     area = json['area'];
//     leader1 = null;
//     leader2 = null;
//     member = List.castFrom<dynamic, dynamic>(json['member']);
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     V = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['_id'] = id;
//     _data['name'] = name;
//     _data['area'] = area;
//     _data['leader1'] = leader1;
//     _data['leader2'] = leader2;
//     _data['member'] = member;
//     _data['createdAt'] = createdAt;
//     _data['updatedAt'] = updatedAt;
//     _data['__v'] = V;
//     return _data;
//   }
// }

// To parse this JSON data, do
//
//     final createContainerModel = createContainerModelFromJson(jsonString);

import 'dart:convert';

CreateContainerModel createContainerModelFromJson(String str) =>
    CreateContainerModel.fromJson(json.decode(str));

String createContainerModelToJson(CreateContainerModel data) =>
    json.encode(data.toJson());

class CreateContainerModel {
  String? status;
  String? message;
  List<TeamResult>? result;

  CreateContainerModel({
    this.status,
    this.message,
    this.result,
  });

  factory CreateContainerModel.fromJson(Map<String, dynamic> json) =>
      CreateContainerModel(
        status: json["status"],
        message: json["message"],
        result: List<TeamResult>.from(
            json["result"].map((x) => TeamResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class TeamResult {
  String? id;
  String? name;
  String? area;
  Leader1? leader1;
  Leader1? leader2;
  List<Leader1>? member;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  TeamResult({
    this.id,
    this.name,
    this.area,
    this.leader1,
    this.leader2,
    this.member,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TeamResult.fromJson(Map<String, dynamic> json) => TeamResult(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        area: json["area"] ?? "",
        // leader1: Leader1.fromJson(json["leader2"] ?? {}),
        // leader2: Leader1.fromJson(json["leader2"] ?? {}),
        member:
            List<Leader1>.from(json["member"].map((x) => Leader1.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"] ?? ""),
        updatedAt: DateTime.parse(json["updatedAt"] ?? ""),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "area": area,
        "leader1": leader1!.toJson(),
        "leader2": leader2!.toJson(),
        "member": List<dynamic>.from(member!.map((x) => x.toJson())),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

class Leader1 {
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
  String? team;

  Leader1({
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
    this.team,
  });

  factory Leader1.fromJson(Map<String, dynamic> json) => Leader1(
        id: json["_id"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        profileImageUrl: json["profile_image_url"] ?? "",
        profileImageSecureUrl: json["profile_image_secure_url"] ?? "",
        imagePublicId: json["image_public_id"] ?? "",
        address: json["address"] ?? "",
        phone: json["phone"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        team: json["team"],
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
        "team": team,
      };
}
