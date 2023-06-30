// To parse this JSON data, do
//
//     final createContainerModel = createContainerModelFromJson(jsonString);

import 'dart:convert';

CreateContainerModel createContainerModelFromJson(String str) => CreateContainerModel.fromJson(json.decode(str));

String createContainerModelToJson(CreateContainerModel data) => json.encode(data.toJson());

class CreateContainerModel {
    String? location;
    int? volume;
    String? team;

    CreateContainerModel({
         this.location,
         this.volume,
         this.team,
    });

    factory CreateContainerModel.fromJson(Map<String, dynamic> json) => CreateContainerModel(
        location: json["location"],
        volume: json["volume"],
        team: json["team"],
    );

    Map<String, dynamic> toJson() => {
        "location": location,
        "volume": volume,
        "team": team,
    };
}
