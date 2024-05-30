// To parse this JSON data, do
//
//     final obtainRankModel = obtainRankModelFromJson(jsonString);

import 'dart:convert';

ObtainRankModel obtainRankModelFromJson(String str) => ObtainRankModel.fromJson(json.decode(str));

String obtainRankModelToJson(ObtainRankModel data) => json.encode(data.toJson());

class ObtainRankModel {
  int ?rankId;
  String ?rankName;
  String? position;
  int? menuPosition;
  int? completeStatus;
  bool ?isActive;

  ObtainRankModel({
    this.rankId,
    this.rankName,
    this.position,
    this.menuPosition,
    this.completeStatus,
    this.isActive,
  });

  factory ObtainRankModel.fromJson(Map<String, dynamic> json) => ObtainRankModel(
    rankId: json["rankId"],
    rankName: json["rankName"],
    position: json["position"],
    menuPosition: json["menuPosition"],
    completeStatus: json["completeStatus"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "rankId": rankId,
    "rankName": rankName,
    "position": position,
    "menuPosition": menuPosition,
    "completeStatus": completeStatus,
    "isActive": isActive,
  };
}
