// To parse this JSON data, do
//
//     final getCourseNamedBySchool = getCourseNamedBySchoolFromJson(jsonString);

import 'dart:convert';

List<GetCourseNamedBySchool> getCourseNamedBySchoolFromJson(String str) => List<GetCourseNamedBySchool>.from(json.decode(str).map((x) => GetCourseNamedBySchool.fromJson(x)));

String getCourseNamedBySchoolToJson(List<GetCourseNamedBySchool> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCourseNamedBySchool {
  int ?courseNameId;
  String ?course;
  int? baseschoolnameid;
  String? schoolname;

  GetCourseNamedBySchool({
    this.courseNameId,
    this.course,
    this.baseschoolnameid,
    this.schoolname,
  });

  factory GetCourseNamedBySchool.fromJson(Map<String, dynamic> json) => GetCourseNamedBySchool(
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
