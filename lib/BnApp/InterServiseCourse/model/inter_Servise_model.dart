// To parse this JSON data, do
//
//     final interServiseCourse = interServiseCourseFromJson(jsonString);

import 'dart:convert';

List<InterServiseCourse> interServiseCourseFromJson(String str) => List<InterServiseCourse>.from(json.decode(str).map((x) => InterServiseCourse.fromJson(x)));

String interServiseCourseToJson(List<InterServiseCourse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InterServiseCourse {
  String ?course;
  DateTime? durationFrom;
  DateTime ?durationTo;
  String ?courseTitle;
  int? courseNameId;
  int? courseDurationId;
  String? remark;
  dynamic countryName;
  String ?orgName;

  InterServiseCourse({
    this.course,
    this.durationFrom,
    this.durationTo,
    this.courseTitle,
    this.courseNameId,
    this.courseDurationId,
    this.remark,
    this.countryName,
    this.orgName,
  });

  factory InterServiseCourse.fromJson(Map<String, dynamic> json) => InterServiseCourse(
    course: json["course"],
    durationFrom: DateTime.parse(json["durationFrom"]),
    durationTo: DateTime.parse(json["durationTo"]),
    courseTitle: json["courseTitle"],
    courseNameId: json["courseNameId"],
    courseDurationId: json["courseDurationId"],
    remark: json["remark"],
    countryName: json["countryName"],
    orgName: json["orgName"],
  );

  Map<String, dynamic> toJson() => {
    "course": course,
    "durationFrom": durationFrom?.toIso8601String(),
    "durationTo": durationTo?.toIso8601String(),
    "courseTitle": courseTitle,
    "courseNameId": courseNameId,
    "courseDurationId": courseDurationId,
    "remark": remark,
    "countryName": countryName,
    "orgName": orgName,
  };
}
