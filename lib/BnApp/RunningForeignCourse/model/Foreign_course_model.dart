// To parse this JSON data, do
//
//     final runningForeignCourse = runningForeignCourseFromJson(jsonString);

import 'dart:convert';

List<RunningForeignCourse> runningForeignCourseFromJson(String str) => List<RunningForeignCourse>.from(json.decode(str).map((x) => RunningForeignCourse.fromJson(x)));

String runningForeignCourseToJson(List<RunningForeignCourse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RunningForeignCourse {
  String ?course;
  DateTime? durationFrom;
  DateTime? durationTo;
  String ?courseTitle;
  int ?courseNameId;
  int? courseDurationId;
  String? remark;
  String? countryName;
  dynamic orgName;

  RunningForeignCourse({
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

  factory RunningForeignCourse.fromJson(Map<String, dynamic> json) => RunningForeignCourse(
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
