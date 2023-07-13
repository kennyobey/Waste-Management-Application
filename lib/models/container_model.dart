// // To parse this JSON data, do
// //
// //     final containerListModel = containerListModelFromJson(jsonString);

// import 'dart:convert';

// ContainerListModel containerListModelFromJson(String str) => ContainerListModel.fromJson(json.decode(str));

// String containerListModelToJson(ContainerListModel data) => json.encode(data.toJson());

// class ContainerListModel {
//     String status;
//     String message;
//     List<ContaineDataModel> result;

//     ContainerListModel({
//         required this.status,
//         required this.message,
//         required this.result,
//     });

//     ContainerListModel copyWith({
//         String? status,
//         String? message,
//         List<ContaineDataModel>? result,
//     }) =>
//         ContainerListModel(
//             status: status ?? this.status,
//             message: message ?? this.message,
//             result: result ?? this.result,
//         );

//     factory ContainerListModel.fromJson(Map<String, dynamic> json) => ContainerListModel(
//         status: json["status"],
//         message: json["message"],
//         result: List<ContaineDataModel>.from(json["result"].map((x) => ContaineDataModel.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "result": List<dynamic>.from(result.map((x) => x.toJson())),
//     };
// }

// class ContaineDataModel {
//     String? id;
//     String? location;
//     int? volume;
//     String? teamResponsible;
//     List<dynamic>? filledCount;
//     List<dynamic>? filledTimestamp;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;

//     ContaineDataModel({
//          this.id,
//          this.location,
//          this.volume,
//          this.teamResponsible,
//          this.filledCount,
//          this.filledTimestamp,
//          this.createdAt,
//          this.updatedAt,
//          this.v,
//     });

//     ContaineDataModel copyWith({
//         String? id,
//         String? location,
//         int? volume,
//         String? teamResponsible,
//         List<dynamic>? filledCount,
//         List<dynamic>? filledTimestamp,
//         DateTime? createdAt,
//         DateTime? updatedAt,
//         int? v,
//     }) =>
//         ContaineDataModel(
//             id: id ?? this.id,
//             location: location ?? this.location,
//             volume: volume ?? this.volume,
//             teamResponsible: teamResponsible ?? this.teamResponsible,
//             filledCount: filledCount ?? this.filledCount,
//             filledTimestamp: filledTimestamp ?? this.filledTimestamp,
//             createdAt: createdAt ?? this.createdAt,
//             updatedAt: updatedAt ?? this.updatedAt,
//             v: v ?? this.v,
//         );

//     factory ContaineDataModel.fromJson(Map<String, dynamic> json) => ContaineDataModel(
//         id: json["_id"],
//         location: json["location"],
//         volume: json["volume"],
//         teamResponsible: json["team_responsible"],
//         filledCount: List<dynamic>.from(json["filled_count"].map((x) => x)),
//         filledTimestamp: List<dynamic>.from(json["filled_timestamp"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "location": location,
//         "volume": volume,
//         "team_responsible": teamResponsible,
//         "filled_count": List<dynamic>.from(filledCount!.map((x) => x)),
//         "filled_timestamp": List<dynamic>.from(filledTimestamp!.map((x) => x)),
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//         "__v": v,
//     };
// }

// To parse this JSON data, do
//
//     final createContainerModel = createContainerModelFromJson(jsonString);

// import 'dart:convert';

// CreateContainerModel createContainerModelFromJson(String str) =>
//     CreateContainerModel.fromJson(json.decode(str));

// String createContainerModelToJson(CreateContainerModel data) =>
//     json.encode(data.toJson());

// class CreateContainerModel {
//   String status;
//   String message;
//   List<ContaineDataModel> result;

//   CreateContainerModel({
//     required this.status,
//     required this.message,
//     required this.result,
//   });

//   factory CreateContainerModel.fromJson(Map<String, dynamic> json) =>
//       CreateContainerModel(
//         status: json["status"],
//         message: json["message"],
//         result: List<ContaineDataModel>.from(
//             json["result"].map((x) => ContaineDataModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "result": List<dynamic>.from(result.map((x) => x.toJson())),
//       };
// }

// class ContaineDataModel {
//   int volumeStatus;
//   int weekFilledCount;
//   int monthFilledCount;
//   String id;
//   String location;
//   String locationLink;
//   int volume;
//   int? filledCount;
//   List<dynamic> weekDataForChart;
//   List<dynamic> monthDataForChart;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;
//   dynamic teamResponsible;
//   double? percentageLevel;

//   ContaineDataModel({
//     required this.volumeStatus,
//     required this.weekFilledCount,
//     required this.monthFilledCount,
//     required this.id,
//     required this.location,
//     required this.locationLink,
//     required this.volume,
//     this.filledCount,
//     required this.weekDataForChart,
//     required this.monthDataForChart,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//     this.teamResponsible,
//     this.percentageLevel,
//   });

//   factory ContaineDataModel.fromJson(Map<String, dynamic> json) =>
//       ContaineDataModel(
//         volumeStatus: json["volume_status"],
//         weekFilledCount: json["week_filled_count"],
//         monthFilledCount: json["month_filled_count"],
//         id: json["_id"],
//         location: json["location"],
//         locationLink: json["location_link"],
//         volume: json["volume"],
//         filledCount: json["filled_count"],
//         weekDataForChart:
//             List<dynamic>.from(json["week_data_for_chart"].map((x) => x)),
//         monthDataForChart:
//             List<dynamic>.from(json["month_data_for_chart"].map((x) => x)),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         teamResponsible: json["team_responsible"],
//         percentageLevel: json["percentage_level"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "volume_status": volumeStatus,
//         "week_filled_count": weekFilledCount,
//         "month_filled_count": monthFilledCount,
//         "_id": id,
//         "location": location,
//         "location_link": locationLink,
//         "volume": volume,
//         "filled_count": filledCount,
//         "week_data_for_chart":
//             List<dynamic>.from(weekDataForChart.map((x) => x)),
//         "month_data_for_chart":
//             List<dynamic>.from(monthDataForChart.map((x) => x)),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//         "team_responsible": teamResponsible,
//         "percentage_level": percentageLevel,
//       };
// }


//////

// To parse this JSON data, do
//
//     final createContainerModel = createContainerModelFromJson(jsonString);

import 'dart:convert';

CreateContainerModel createContainerModelFromJson(String str) => CreateContainerModel.fromJson(json.decode(str));

String createContainerModelToJson(CreateContainerModel data) => json.encode(data.toJson());

class CreateContainerModel {
    String status;
    String message;
    List<ContaineDataModel> result;

    CreateContainerModel({
        required this.status,
        required this.message,
        required this.result,
    });

    factory CreateContainerModel.fromJson(Map<String, dynamic> json) => CreateContainerModel(
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
    int volumeStatus;
    int weekFilledCount;
    int monthFilledCount;
    String id;
    String location;
    String locationLink;
    int volume;
    int? filledCount;
    List<dynamic> weekDataForChart;
    List<dynamic> monthDataForChart;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    TeamResponsible? teamResponsible;
    double? percentageLevel;

    ContaineDataModel({
        required this.volumeStatus,
        required this.weekFilledCount,
        required this.monthFilledCount,
        required this.id,
        required this.location,
        required this.locationLink,
        required this.volume,
        this.filledCount,
        required this.weekDataForChart,
        required this.monthDataForChart,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        this.teamResponsible,
        this.percentageLevel,
    });

    factory ContaineDataModel.fromJson(Map<String, dynamic> json) => ContaineDataModel(
        volumeStatus: json["volume_status"],
        weekFilledCount: json["week_filled_count"],
        monthFilledCount: json["month_filled_count"],
        id: json["_id"],
        location: json["location"],
        locationLink: json["location_link"],
        volume: json["volume"],
        filledCount: json["filled_count"],
        weekDataForChart: List<dynamic>.from(json["week_data_for_chart"].map((x) => x)),
        monthDataForChart: List<dynamic>.from(json["month_data_for_chart"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        teamResponsible: json["team_responsible"] == null ? null : TeamResponsible.fromJson(json["team_responsible"]),
        percentageLevel: json["percentage_level"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "volume_status": volumeStatus,
        "week_filled_count": weekFilledCount,
        "month_filled_count": monthFilledCount,
        "_id": id,
        "location": location,
        "location_link": locationLink,
        "volume": volume,
        "filled_count": filledCount,
        "week_data_for_chart": List<dynamic>.from(weekDataForChart.map((x) => x)),
        "month_data_for_chart": List<dynamic>.from(monthDataForChart.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "team_responsible": teamResponsible?.toJson(),
        "percentage_level": percentageLevel,
    };
}

class TeamResponsible {
    String id;
    String name;
    String area;
    String leader1;
    String leader2;
    List<dynamic> member;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    TeamResponsible({
        required this.id,
        required this.name,
        required this.area,
        required this.leader1,
        required this.leader2,
        required this.member,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory TeamResponsible.fromJson(Map<String, dynamic> json) => TeamResponsible(
        id: json["_id"],
        name: json["name"],
        area: json["area"],
        leader1: json["leader1"],
        leader2: json["leader2"],
        member: List<dynamic>.from(json["member"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "area": area,
        "leader1": leader1,
        "leader2": leader2,
        "member": List<dynamic>.from(member.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
