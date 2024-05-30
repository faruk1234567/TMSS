// To parse this JSON data, do
//
//     final courseByNamedModel = courseByNamedModelFromJson(jsonString);

import 'dart:convert';

List<CourseByNamedModel> courseByNamedModelFromJson(String str) => List<CourseByNamedModel>.from(json.decode(str).map((x) => CourseByNamedModel.fromJson(x)));

String courseByNamedModelToJson(List<CourseByNamedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseByNamedModel {
  int? courseNameId;
  String? course;
  int? baseschoolnameid;
  String? schoolname;

  CourseByNamedModel({
    this.courseNameId,
    this.course,
    this.baseschoolnameid,
    this.schoolname,
  });

  factory CourseByNamedModel.fromJson(Map<String, dynamic> json) => CourseByNamedModel(
    courseNameId: json["courseNameId"],
    course: json["course"],
    baseschoolnameid: json["baseschoolnameid"],
    schoolname: json["schoolname"],
  );

  Map<String, dynamic> toJson() => {
    "courseNameId": courseNameId,
    "course": course,
    "baseschoolnameid": baseschoolnameid,
    "schoolname": schoolname,
  };
}
