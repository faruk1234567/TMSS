// To parse this JSON data, do
//
//     final schoolOfficersModel = schoolOfficersModelFromJson(jsonString);

import 'dart:convert';

List<SchoolOfficersModel> schoolOfficersModelFromJson(String str) => List<SchoolOfficersModel>.from(json.decode(str).map((x) => SchoolOfficersModel.fromJson(x)));

String schoolOfficersModelToJson(List<SchoolOfficersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolOfficersModel {
  int? traineeId;
  String ?courseTitle;
  String? name;
  String ?course;
  String ?position;
  String? pno;
  String ?schoolName;
  DateTime ?durationFrom;
  DateTime ?durationTo;

  SchoolOfficersModel({
    this.traineeId,
    this.courseTitle,
    this.name,
    this.course,
    this.position,
    this.pno,
    this.schoolName,
    this.durationFrom,
    this.durationTo,
  });

  factory SchoolOfficersModel.fromJson(Map<String, dynamic> json) => SchoolOfficersModel(
    traineeId: json["traineeId"],
    courseTitle: json["courseTitle"],
    name: json["name"],
    course: json["course"],
    position: json["position"],
    pno: json["pno"],
    schoolName: json["schoolName"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
  );

  Map<String, dynamic> toJson() => {
    "traineeId": traineeId,
    "courseTitle": courseTitle,
    "name": name,
    "course": course,
    "position": position,
    "pno": pno,
    "schoolName": schoolName,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
  };
}
