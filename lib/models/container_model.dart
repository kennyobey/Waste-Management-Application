// To parse this JSON data, do
//
//     final containerListModel = containerListModelFromJson(jsonString);

import 'dart:convert';

ContainerListModel containerListModelFromJson(String str) => ContainerListModel.fromJson(json.decode(str));

String containerListModelToJson(ContainerListModel data) => json.encode(data.toJson());

class ContainerListModel {
    String status;
    String message;
    List<ContaineDataModel> result;

    ContainerListModel({
        required this.status,
        required this.message,
        required this.result,
    });

    ContainerListModel copyWith({
        String? status,
        String? message,
        List<ContaineDataModel>? result,
    }) => 
        ContainerListModel(
            status: status ?? this.status,
            message: message ?? this.message,
            result: result ?? this.result,
        );

    factory ContainerListModel.fromJson(Map<String, dynamic> json) => ContainerListModel(
        status: json["status"],
        message: json["message"],
        result: List<ContaineDataModel>.from(json["result"].map((x) => ContaineDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class ContaineDataModel {
    String? id;
    String? location;
    int? volume;
    String? teamResponsible;
    List<dynamic>? filledCount;
    List<dynamic>? filledTimestamp;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    ContaineDataModel({
         this.id,
         this.location,
         this.volume,
         this.teamResponsible,
         this.filledCount,
         this.filledTimestamp,
         this.createdAt,
         this.updatedAt,
         this.v,
    });

    ContaineDataModel copyWith({
        String? id,
        String? location,
        int? volume,
        String? teamResponsible,
        List<dynamic>? filledCount,
        List<dynamic>? filledTimestamp,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) => 
        ContaineDataModel(
            id: id ?? this.id,
            location: location ?? this.location,
            volume: volume ?? this.volume,
            teamResponsible: teamResponsible ?? this.teamResponsible,
            filledCount: filledCount ?? this.filledCount,
            filledTimestamp: filledTimestamp ?? this.filledTimestamp,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory ContaineDataModel.fromJson(Map<String, dynamic> json) => ContaineDataModel(
        id: json["_id"],
        location: json["location"],
        volume: json["volume"],
        teamResponsible: json["team_responsible"],
        filledCount: List<dynamic>.from(json["filled_count"].map((x) => x)),
        filledTimestamp: List<dynamic>.from(json["filled_timestamp"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "location": location,
        "volume": volume,
        "team_responsible": teamResponsible,
        "filled_count": List<dynamic>.from(filledCount!.map((x) => x)),
        "filled_timestamp": List<dynamic>.from(filledTimestamp!.map((x) => x)),
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}
