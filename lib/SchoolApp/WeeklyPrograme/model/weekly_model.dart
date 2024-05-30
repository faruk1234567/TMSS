// To parse this JSON data, do
//
//     final schoolWeeklyModel = schoolWeeklyModelFromJson(jsonString);

import 'dart:convert';

List<SchoolWeeklyModel> schoolWeeklyModelFromJson(String str) => List<SchoolWeeklyModel>.from(json.decode(str).map((x) => SchoolWeeklyModel.fromJson(x)));

String schoolWeeklyModelToJson(List<SchoolWeeklyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SchoolWeeklyModel {
  int? routineCount;
  int? courseNameId;
  int? courseDurationId;
  String? course;
  String ?courseTitle;
  DateTime? durationFrom;
  DateTime ?durationTo;

  SchoolWeeklyModel({
    this.routineCount,
    this.courseNameId,
    this.courseDurationId,
    this.course,
    this.courseTitle,
    this.durationFrom,
    this.durationTo,
  });

  factory SchoolWeeklyModel.fromJson(Map<String, dynamic> json) => SchoolWeeklyModel(
    routineCount: json["routineCount"],
    courseNameId: json["courseNameId"],
    courseDurationId: json["courseDurationId"],
    course: json["course"],
    courseTitle: json["courseTitle"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
  );

  Map<String, dynamic> toJson() => {
    "routineCount": routineCount,
    "courseNameId": courseNameId,
    "courseDurationId": courseDurationId,
    "course": course,
    "courseTitle": courseTitle,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
  };
}
