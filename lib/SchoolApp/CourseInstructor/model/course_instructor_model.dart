// To parse this JSON data, do
//
//     final courseInstructorModel = courseInstructorModelFromJson(jsonString);

import 'dart:convert';

List<CourseInstructorModel> courseInstructorModelFromJson(String str) => List<CourseInstructorModel>.from(json.decode(str).map((x) => CourseInstructorModel.fromJson(x)));

String courseInstructorModelToJson(List<CourseInstructorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseInstructorModel {
  int? instructorCount;
  int? courseNameId;
  String ?course;
  String? courseTitle;
  int? courseDurationId;
  int? baseSchoolNameId;

  CourseInstructorModel({
    this.instructorCount,
    this.courseNameId,
    this.course,
    this.courseTitle,
    this.courseDurationId,
    this.baseSchoolNameId,
  });

  factory CourseInstructorModel.fromJson(Map<String, dynamic> json) => CourseInstructorModel(
    instructorCount: json["instructorCount"],
    courseNameId: json["courseNameId"],
    course: json["course"],
    courseTitle: json["courseTitle"],
    courseDurationId: json["courseDurationId"],
    baseSchoolNameId: json["baseSchoolNameId"],
  );

  Map<String, dynamic> toJson() => {
    "instructorCount": instructorCount,
    "courseNameId": courseNameId,
    "course": course,
    "courseTitle": courseTitle,
    "courseDurationId": courseDurationId,
    "baseSchoolNameId": baseSchoolNameId,
  };
}
