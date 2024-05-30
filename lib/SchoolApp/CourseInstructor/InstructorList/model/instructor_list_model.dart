// To parse this JSON data, do
//
//     final courseInstructorListModel = courseInstructorListModelFromJson(jsonString);

import 'dart:convert';

List<CourseInstructorListModel> courseInstructorListModelFromJson(String str) => List<CourseInstructorListModel>.from(json.decode(str).map((x) => CourseInstructorListModel.fromJson(x)));

String courseInstructorListModelToJson(List<CourseInstructorListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseInstructorListModel {
  String? course;
  String ?courseTitle;
  String ?subjectName;
  dynamic shortName;
  String? name;
  String ?pno;
  String? position;

  CourseInstructorListModel({
    this.course,
    this.courseTitle,
    this.subjectName,
    this.shortName,
    this.name,
    this.pno,
    this.position,
  });

  factory CourseInstructorListModel.fromJson(Map<String, dynamic> json) => CourseInstructorListModel(
    course: json["course"],
    courseTitle: json["courseTitle"],
    subjectName: json["subjectName"],
    shortName: json["shortName"],
    name: json["name"],
    pno: json["pno"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "course": course,
    "courseTitle": courseTitle,
    "subjectName": subjectName,
    "shortName": shortName,
    "name": name,
    "pno": pno,
    "position": position,
  };
}
