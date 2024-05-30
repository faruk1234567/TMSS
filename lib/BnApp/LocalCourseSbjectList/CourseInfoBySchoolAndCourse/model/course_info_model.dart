// To parse this JSON data, do
//
//     final courseInfoModel = courseInfoModelFromJson(jsonString);

import 'dart:convert';

List<CourseInfoModel> courseInfoModelFromJson(String str) => List<CourseInfoModel>.from(json.decode(str).map((x) => CourseInfoModel.fromJson(x)));

String courseInfoModelToJson(List<CourseInfoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseInfoModel {
  String? courseTitle;
  DateTime? durationFrom;
  DateTime ?durationTo;
  int? baseSchoolNameId;
  String ?course;
  String ?courseTitle1;
  String? schoolName;

  CourseInfoModel({
    this.courseTitle,
    this.durationFrom,
    this.durationTo,
    this.baseSchoolNameId,
    this.course,
    this.courseTitle1,
    this.schoolName,
  });

  factory CourseInfoModel.fromJson(Map<String, dynamic> json) => CourseInfoModel(
    courseTitle: json["courseTitle"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    baseSchoolNameId: json["baseSchoolNameId"],
    course: json["course"],
    courseTitle1: json["courseTitle1"],
    schoolName: json["schoolName"],
  );

  Map<String, dynamic> toJson() => {
    "courseTitle": courseTitle,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
    "baseSchoolNameId": baseSchoolNameId,
    "course": course,
    "courseTitle1": courseTitle1,
    "schoolName": schoolName,
  };
}
