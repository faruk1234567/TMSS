// To parse this JSON data, do
//
//     final nameOftheCourseModel = nameOftheCourseModelFromJson(jsonString);

import 'dart:convert';

NameOftheCourseModel nameOftheCourseModelFromJson(String str) => NameOftheCourseModel.fromJson(json.decode(str));

String nameOftheCourseModelToJson(NameOftheCourseModel data) => json.encode(data.toJson());

class NameOftheCourseModel {
  int ?courseNameId;
  int? courseTypeId;
  String ?course;
  String ?shortName;
  dynamic courseSyllabus;
  dynamic menuPosition;
  bool ?isActive;
  dynamic courseTypeName;

  NameOftheCourseModel({
    this.courseNameId,
    this.courseTypeId,
    this.course,
    this.shortName,
    this.courseSyllabus,
    this.menuPosition,
    this.isActive,
    this.courseTypeName,
  });

  factory NameOftheCourseModel.fromJson(Map<String, dynamic> json) => NameOftheCourseModel(
    courseNameId: json["courseNameId"],
    courseTypeId: json["courseTypeId"],
    course: json["course"],
    shortName: json["shortName"],
    courseSyllabus: json["courseSyllabus"],
    menuPosition: json["menuPosition"],
    isActive: json["isActive"],
    courseTypeName: json["courseTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "courseNameId": courseNameId,
    "courseTypeId": courseTypeId,
    "course": course,
    "shortName": shortName,
    "courseSyllabus": courseSyllabus,
    "menuPosition": menuPosition,
    "isActive": isActive,
    "courseTypeName": courseTypeName,
  };
}
