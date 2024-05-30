// To parse this JSON data, do
//
//     final foreignTraineeModel = foreignTraineeModelFromJson(jsonString);

import 'dart:convert';

List<ForeignTraineeModel> foreignTraineeModelFromJson(String str) => List<ForeignTraineeModel>.from(json.decode(str).map((x) => ForeignTraineeModel.fromJson(x)));

String foreignTraineeModelToJson(List<ForeignTraineeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForeignTraineeModel {
  int ?traineeId;
  String ?name;
  String? course;
  String? courseTitle;
  String ?countryName;
  String? position;
  String? pno;
  String? schoolName;
  DateTime? durationFrom;
  DateTime? durationTo;

  ForeignTraineeModel({
    this.traineeId,
    this.name,
    this.course,
    this.courseTitle,
    this.countryName,
    this.position,
    this.pno,
    this.schoolName,
    this.durationFrom,
    this.durationTo,
  });

  factory ForeignTraineeModel.fromJson(Map<String, dynamic> json) => ForeignTraineeModel(
    traineeId: json["traineeId"],
    name: json["name"],
    course: json["course"],
    courseTitle: json["courseTitle"],
    countryName: json["countryName"],
    position: json["position"],
    pno: json["pno"],
    schoolName: json["schoolName"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
  );

  Map<String, dynamic> toJson() => {
    "traineeId": traineeId,
    "name": name,
    "course": course,
    "courseTitle": courseTitle,
    "countryName": countryName,
    "position": position,
    "pno": pno,
    "schoolName": schoolName,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
  };
}
