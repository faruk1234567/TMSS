// To parse this JSON data, do
//
//     final courseNameDetail = courseNameDetailFromJson(jsonString);

import 'dart:convert';

CourseNameDetail courseNameDetailFromJson(String str) => CourseNameDetail.fromJson(json.decode(str));

String courseNameDetailToJson(CourseNameDetail data) => json.encode(data.toJson());

class CourseNameDetail {
  int ?courseNameId;
  int? courseTypeId;
  String ?course;
  String? shortName;
  dynamic courseSyllabus;
  dynamic menuPosition;
  bool? isActive;
  dynamic courseTypeName;

  CourseNameDetail({
    this.courseNameId,
    this.courseTypeId,
    this.course,
    this.shortName,
    this.courseSyllabus,
    this.menuPosition,
    this.isActive,
    this.courseTypeName,
  });

  factory CourseNameDetail.fromJson(Map<String, dynamic> json) => CourseNameDetail(
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
